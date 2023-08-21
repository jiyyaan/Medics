import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/repository/doctor_detail_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DoctorPanelController extends GetxController{
  final DoctorDetailRepository _doctorDetail = DoctorDetailRepository();
  final String doctorID = Get.arguments;
  Rx<bool> isLoading = true.obs;
  List<DoctorProfileModel> doctorDetail = <DoctorProfileModel>[].obs;

  final TextEditingController feeController = TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController endingTimeController = TextEditingController();
  final FocusNode feeFocusNode = FocusNode();
  final FocusNode startingTimeFocusNode = FocusNode();
  final FocusNode endingTimeFocusNode = FocusNode();

  Rx<double> left = 0.0.obs;
  Rx<double> top = 0.0.obs;

  Rx<TimeOfDay> startTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<TimeOfDay> endTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<bool> sessionActive = false.obs;
  RxList<String> sessionList = <String>[].obs;
  // List<String> sessionList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentLeftTopPosition();
    fetchDoctorDetail();
  }

  ///24 hours to 12 hours Conversion Method
  String convertTimeTo12HourFormat(String time24Hour, BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(time24Hour.split(':')[0]),
      minute: int.parse(time24Hour.split(':')[1]),
    );
    String formattedTime12Hour = timeOfDay.format(context);
    return formattedTime12Hour;
  }
  Future<void> startingTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Initial time value
    );
    if (picked != null) {
      startingTimeController.text = picked.format(context);
      startTime.value = picked;
    }else{
      startingTimeController.text = TimeOfDay.now().format(context);
      startTime.value = TimeOfDay.now();
    }
  }
  Future<void> endingTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Initial time value
    );
    if (picked != null && picked != TimeOfDay.now()) {
      endingTimeController.text = picked.format(context);
      endTime.value = picked;
    }else{
      endingTimeController.text = TimeOfDay.now().format(context);
      endTime.value = TimeOfDay.now();
    }
  }
  RxList<String> calculateSessions(TimeOfDay startTime, TimeOfDay endTime) {
    RxList<String> sessions = <String>[].obs;
    DateTime currentSession = DateTime(1, 1, 1, startTime.hour, startTime.minute);
    while (currentSession.isBefore(DateTime(1, 1, 1, endTime.hour, endTime.minute))) {
      sessions.add('${currentSession.hour}:${currentSession.minute.toString().padLeft(2, '0')}');
      currentSession = currentSession.add(const Duration(minutes: 20));
    }
    (sessions.isEmpty)?sessionActive.value = false : sessionActive.value = true;
    return sessions;
  }


  /// Set Chat Widget Position
  setPosition() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("left", left.value);
    prefs.setDouble("top", top.value);
  }
  Future currentLeftTopPosition() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double? leftPosition = prefs.getDouble('left');
    double? topPosition = prefs.getDouble('top');
    prefs.setDouble('left', leftPosition!);
    prefs.setDouble('top', topPosition!);
    top.value = topPosition;
    left.value = leftPosition;
  }
  void fetchDoctorDetail()async{
    isLoading.value = true;
    Map data = {
      'doctor_id': doctorID
    };
    try{
      var responseData = await _doctorDetail.fetchDoctorProfileForDoctorPanel(data);
      doctorDetail.assignAll(responseData);
      isLoading.value = false;
    }
    catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }
}