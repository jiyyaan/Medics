import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/repository/doctor_panel_repo.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view/doctor_panel/doctor_panel.dart';

class DoctorFormTwoController extends GetxController{
  final String doctorID = Get.arguments;
  Rx<bool> isLoading = true.obs;
  final DoctorPanelRepositories _api = DoctorPanelRepositories();

  final TextEditingController feeController = TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController endingTimeController = TextEditingController();
  final FocusNode feeFocusNode = FocusNode();
  final FocusNode startingTimeFocusNode = FocusNode();
  final FocusNode endingTimeFocusNode = FocusNode();



  /// All Variables for Time Calculation
  Rx<TimeOfDay> startTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<TimeOfDay> endTime = Rx<TimeOfDay>(TimeOfDay.now());
  Rx<bool> sessionActive = false.obs;
  RxList<String> sessionList = <String>[].obs;

  ///24 hours to 12 hours Conversion Method
  String convertTimeTo12HourFormat(String time24Hour, BuildContext context) {
    TimeOfDay timeOfDay = TimeOfDay(
      hour: int.parse(time24Hour.split(':')[0]),
      minute: int.parse(time24Hour.split(':')[1]),
    );
    String formattedTime12Hour = timeOfDay.format(context);
    return formattedTime12Hour;
  }
  ///Starting Time  Selector Method
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
  ///Ending Time  Selector Method
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
  /// Calculate Time and make each 20 minutes session
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

  /// Function for Sending Second Form Data into Database
  void doctorFormTwo(BuildContext context) {
    String startTime24Hour = '${startTime.value.hour.toString().padLeft(2, '0')}:${startTime.value.minute.toString().padLeft(2, '0')}';
    String endTime24Hour = '${endTime.value.hour.toString().padLeft(2, '0')}:${endTime.value.minute.toString().padLeft(2, '0')}';

    bool? fields = isFieldEmpty();
    if (fields != false) {
      Map data = {
        'doctorID': doctorID,
        'consultancyFee': feeController.value.text,
        'startingTime': startTime24Hour,
        'endingTime': endTime24Hour
      };
      _api.doctorFormTwo(data).then((value) {
        if (value["success"] == "true") {
          Get.toNamed(
            RoutesNames.doctorPanel,
            arguments: doctorID,
          );
          Utils.toastMessage(value["message"]);
        } else {
          Utils.toastErrorMessage(value["message"]);
        }
      }).onError((error, stackTrace) {
        Utils.showSnackBar(context, error.toString());
      });
    }
  }

  /// Field checking method isEmpty or Not
  bool isFieldEmpty() {
    if (feeController.value.text == "") {
      Utils.toastErrorMessage("Please Add your consultancy fee");
      feeFocusNode.requestFocus();
      return false;
    }
    if (startingTimeController.value.text == "") {
      Utils.toastErrorMessage("Please Starting Time");
      startingTimeFocusNode.requestFocus();
      return false;
    }
    if (endingTimeController.value.text == "") {
      Utils.toastErrorMessage("Please Ending Time");
      endingTimeFocusNode.requestFocus();
      return false;
    } else {
      return true;
    }
  }
}