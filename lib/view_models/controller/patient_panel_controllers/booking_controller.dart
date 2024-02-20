import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/models/booking_data.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/patient_profile_model.dart';
import 'package:medics/models/payment_method_model.dart';
import 'package:medics/repository/doctor_panel_repo.dart';
import 'package:medics/repository/patient_panel_repo.dart';
import 'package:medics/repository/payment_method_repository.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view_models/controller/patient_panel_controllers/home_controller.dart';

class BookingController extends GetxController{

  final DoctorPanelRepositories _doctorDetail = DoctorPanelRepositories();
  final PatientPanelRepositories _api = PatientPanelRepositories();
  final PaymentRepository _payMethod = PaymentRepository();

  final BookingModel bookingModel = Get.arguments;
  var patientID = Get.find<HomeController>().patientDetail[0].patientId;
  Rx<bool> isLoading = true.obs;
  final totalAmount = ''.obs;
  Rx<String> symptoms = "".obs;
  List<DoctorProfileModel> doctorDetail = <DoctorProfileModel>[].obs;
  List<PatientProfileModel> patientDetail = <PatientProfileModel>[].obs;


  final TextEditingController symptomsController = TextEditingController();
  final FocusNode symptomsFocusNode = FocusNode();


  /// Variable for Payment Method
  List<PaymentMethodModel> paymentMethodList = <PaymentMethodModel>[].obs;
  var selectedPaymentMethod = "0".obs;
  Rx<List<DropdownMenuItem<String>>> dropDownItems = Rx<List<DropdownMenuItem<String>>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDoctorDetail();
    fetchPaymentMethods();
  }

  /// Payment Detail Method
  double paymentTotal({required double consultation, required double addlDiscount, required double adminFee}){
    var total = ((consultation) - (addlDiscount) + (adminFee));
    return total;
  }
  /// Get Payment Methods
  void fetchPaymentMethods()async{
    try{
      isLoading(true);
      var responseData = await _payMethod.fetchPaymentMethods();
      paymentMethodList.assignAll(responseData);
      dropDownItems.value = [];
      dropDownItems.value.add(
          const DropdownMenuItem(
            value: "0",
            child: Text('Select Payment Method', style: TextStyle(color: Colors.black),),),
          );
      for(PaymentMethodModel model in paymentMethodList){
        dropDownItems.value.add(
          DropdownMenuItem(
            value: model.payMethodId.toString(),
            child: Row(
              children: [
                Text(model.payType.toString(), style: const TextStyle(color: Colors.black),),
                const Spacer(),
                SizedBox(
                  width: 45,
                  height: 20,
                  child: Image.network('${AppUrl.logos}${model.payIcon.toString()}',fit: BoxFit.contain,),
                ),
              ],
            ),
          ),
        );
      }
    }
    finally{
      isLoading(false);
    }
  }
  /// Fetch Doctor
  void fetchDoctorDetail()async{
    Map data = {
      'doctor_id': bookingModel.doctorID
    };
    try{
      isLoading(true);
      var responseData = await _doctorDetail.fetchDoctorDetail(data);
      doctorDetail.assignAll(responseData);
    }
    finally{
      isLoading(false);
    }
  }


  /// Get Appointment Method
  getAppointment(BuildContext context){
    if (symptomsController.value.text == "") {
      Utils.toastErrorMessage("Please write something why are you discomfort.");
      symptomsFocusNode.requestFocus();
      return false;
    }
    if(selectedPaymentMethod.value == "0" || selectedPaymentMethod.value == ""){
      Utils.toastErrorMessage("Please select payment method");
      return false;
    } else{
      Map data = {
        'patientID': patientID,
        'doctorID': doctorDetail[0].docProfileId,
        'date': bookingModel.dateAppointment,
        'timeID': bookingModel.timeID,
        'symptoms': symptomsController.text,
        'consultFee': totalAmount.value,
        'payMethodID': selectedPaymentMethod.value,
      };
      _api.bookAppointment(data).then((value) {
        if (value["success"] == "true") {
          Utils.successDialog("Your appointment has been locked Successfully!", onclick: () {
            Get.offNamedUntil(RoutesNames.patientPanel, arguments: patientID, (route) => false);
          });
        } else {
          Utils.toastErrorMessage(value["message"]);
          if (kDebugMode) {
            print(value["message"]);
          }
        }
      }).onError((error, stackTrace) {
        Utils.showSnackBar(context, error.toString());
      });
    }
  }
}
