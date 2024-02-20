
import 'dart:convert';
import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/reserved_time_doctors.dart';
import 'package:medics/models/time_table_model.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class DoctorPanelRepositories {
  NetworkApiService networkApiService = NetworkApiService();

  ///Doctor Form One Repository
  Future<dynamic> doctorFormOne(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.doctorFormOne, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Doctor Form Two Repository
  Future<dynamic> doctorFormTwo(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.doctorFormTwo, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Doctor Form Two Repository
  Future<dynamic> interviewMessage(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.interviewMessage, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Doctor Profile Repository
  Future<dynamic> getUserRecord(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.userRecord, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
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
  /// Fetch Reserved Time Doctors List
  Future<List<ReservedTimeDoctors>> fetchReservedTimeDoctors(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.reservedTimeDoctors, data);
      return reservedTimeDoctorsFromJson(response);

    } catch (e) {
      rethrow;
    }
  }
}

