import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/repository/doctor_detail_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorPanelController extends GetxController{
  final DoctorDetailRepository _doctorDetail = DoctorDetailRepository();
  final String doctorID = Get.arguments;
  Rx<bool> isLoading = true.obs;
  RxList<DoctorProfileModel> doctorDetail = <DoctorProfileModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentLeftTopPosition();
    fetchDoctorDetail();
  }

  /// Variable for Setting and Getting Position for Chat Icon
  Rx<double> left = 0.0.obs;
  Rx<double> top = 0.0.obs;
  /// Set Chat Widget Position
  setPosition() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("left", left.value);
    prefs.setDouble("top", top.value);
  }
  /// Get Chat Widget Position
  Future currentLeftTopPosition() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double? leftPosition = prefs.getDouble('left');
    double? topPosition = prefs.getDouble('top');
    prefs.setDouble('left', leftPosition!);
    prefs.setDouble('top', topPosition!);
    top.value = topPosition;
    left.value = leftPosition;
  }
  /// Fetch Doctor Detail
  void fetchDoctorDetail()async{
    Map data = {
      'doctor_id': doctorID
    };
    try{
      var responseData = await _doctorDetail.fetchDoctorProfileForDoctorPanel(data);
      doctorDetail.assignAll(responseData);
    }
    catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


}