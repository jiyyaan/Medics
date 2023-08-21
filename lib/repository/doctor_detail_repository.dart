
import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/time_table_model.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class DoctorDetailRepository{
  NetworkApiService networkApiService = NetworkApiService();

  ///Doctor Detail
  Future<List<DoctorProfileModel>> fetchDoctorDetail(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.doctorDetail, data);
      return doctorProfileModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Doctor Profile for Doctor Panel
  Future<List<DoctorProfileModel>> fetchDoctorProfileForDoctorPanel(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.doctorProfileDoctorPanel, data);
      return doctorProfileModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Doctor Time Table (Schedule)
  Future<List<TimeTableModel>> fetchTimeTable(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.timeTable, data);
      return timeTableModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}