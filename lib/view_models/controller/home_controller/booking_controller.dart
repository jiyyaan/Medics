import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/models/booking_data.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/payment_method_model.dart';
import 'package:medics/repository/doctor_detail_repository.dart';
import 'package:medics/repository/payment_method_repository.dart';


class BookingController extends GetxController{

  final DoctorDetailRepository _doctorDetail = DoctorDetailRepository();
  final PaymentRepository _payMethod = PaymentRepository();

  final BookingModel bookingModel = Get.arguments;
  Rx<String> dateTime = "".obs;
  Rx<bool> isLoading = true.obs;
  final totalAmount = ''.obs;
  Rx<String> reason = "Tell me about your discomfort...".obs;
  TextEditingController textController = TextEditingController();
  List<DoctorProfileModel> doctorDetail = <DoctorProfileModel>[].obs;

  /// Variable for Payment Method
  List<PaymentMethodModel> paymentMethodList = <PaymentMethodModel>[].obs;
  var selectedPaymentMethod = "0".obs;
  Rx<List<DropdownMenuItem<String>>> dropDownItems = Rx<List<DropdownMenuItem<String>>>([]);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textController.text = reason.value;
    fetchDoctorDetail();
    fetchPayamentMethods();
  }
  /// Payment Detail Method
  double paymentTotal({required double consultation, required double addlDiscount, required double adminFee}){
    var total = ((consultation) - (addlDiscount) + (adminFee));
    return total;
  }
  /// Get Payment Methods
  void fetchPayamentMethods()async{
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
                  child: Image.asset('assets/icons/${model.payIcon.toString()}',fit: BoxFit.contain,),
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
}