import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/reserved_time_doctors.dart';
import 'package:medics/models/time_table_model.dart';
import 'package:medics/repository/doctor_panel_repo.dart';

class DoctorDetailController extends GetxController{
  final DoctorPanelRepositories _doctorDetail = DoctorPanelRepositories();

  Rx<bool> isReadMore = false.obs;
  Rx<bool> isLoading = false.obs;
  String doctorID = Get.arguments;
  Rx<String> timeID = "".obs;
  Rx<int> timeIndex = (-1).obs;
  Rx<int> dateIndex = (-1).obs;
  Rx<String> selectedDate = ''.obs;
  Rx<String> selectedTime = ''.obs;

  List<DoctorProfileModel> doctorDetail = <DoctorProfileModel>[].obs;
  List<Map<String, dynamic>> datesList = [];
  List<TimeTableModel> timeList = <TimeTableModel>[].obs;
  List<ReservedTimeDoctors> reservedTimeList = <ReservedTimeDoctors>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDoctorDetail();
    getNext30Days();
    fetchTimeTable();
    fetchReservedTimeDoctors();
  }
  ///24 hours to 12 hours Conversion Method
  String twelveHourFormat(String time) {
    DateFormat format24 = DateFormat('HH:mm:ss');
    DateFormat format12 = DateFormat('hh:mm a');
    String time24Hour = time.toString(); // Example time in 24-hour format
    DateTime dateTime = format24.parse(time24Hour);
    String time12Hour = format12.format(dateTime);
    return time12Hour;
  }
  /// Fetch Doctor
  void fetchDoctorDetail()async{
    Map data = {
      'doctor_id': doctorID
    };
    try{
      var responseData = await _doctorDetail.fetchDoctorDetail(data);
      doctorDetail.assignAll(responseData);
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  /// Fetch Date and Day
  void getNext30Days() {
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 30; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));

      String formattedDate = DateFormat('dd').format(nextDate);
      String formattedDay = DateFormat('E').format(nextDate);
      String formattedMonth = DateFormat('MMMM').format(nextDate);
      String formattedDateComplete = DateFormat('EEEE, MMMM d, yyyy').format(nextDate);

      Map<String, dynamic> dateInfo = {
        'date': formattedDate,
        'day': formattedDay.toUpperCase(),
        'month': formattedMonth,
        'selectedDate': formattedDateComplete,
      };
      datesList.add(dateInfo);
    }
  }
  ///Fetch Time Table
  void fetchTimeTable()async{
    Map data = {
      'doctor_id': doctorID
    };
    try{
      var responseData = await _doctorDetail.fetchTimeTable(data);
      timeList.assignAll(responseData);
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void fetchReservedTimeDoctors()async{
    Map data = {
      'selected_date': selectedDate.value,
      'doctor_id': doctorID
    };
    isLoading.value = false;
    try{
      isLoading.value = false;
      var responseData = await _doctorDetail.fetchReservedTimeDoctors(data);
      reservedTimeList.assignAll(responseData);
      isLoading.value = true;
    }
    catch(e){
      if (kDebugMode) {
        isLoading.value = false;
        print(e.toString());
      }
    }
  }
}
