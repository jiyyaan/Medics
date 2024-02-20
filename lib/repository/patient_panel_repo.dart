import 'dart:convert';

import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/models/category_model.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/patient_profile_model.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class PatientPanelRepositories {
  NetworkApiService networkApiService = NetworkApiService();

  /// Fetch categories
  Future<List<CategoryModel>> fetchCategoryApi() async {
    try {
      dynamic response =
      await networkApiService.getApiResponse(AppUrl.category);
      return categoryModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  /// Fetch Doctor Profile
  Future<List<DoctorProfileModel>> fetchDoctorProfile() async {
    try {
      dynamic response =
      await networkApiService.getApiResponse(AppUrl.doctorProfile);
      return doctorProfileModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Patient Detail
  Future<List<PatientProfileModel>> fetchPatientDetail(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.patientDetail, data);
      return patientProfileModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Patient Form One Repository
  Future<dynamic> patientFormOne(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.patientFormOne, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  /// Get user Record
  Future<dynamic> getUserRecord(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.userRecord, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Book Appointment
  Future<dynamic> bookAppointment(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.bookAppointment, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}