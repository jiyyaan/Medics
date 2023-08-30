
import 'dart:convert';
import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class PatientPanelRepositories {
  NetworkApiService networkApiService = NetworkApiService();

  ///Patient Profile Repository
  Future<dynamic> patientPanel(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.patientPanel, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Doctor Form One Repository
  Future<dynamic> patientFormOne(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.patientFormOne, data);
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

}

