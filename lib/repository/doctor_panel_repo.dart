
import 'dart:convert';
import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class DoctorPanelRepositories {
  NetworkApiService networkApiService = NetworkApiService();

  ///Doctor Profile Repository
  Future<dynamic> doctorPanel(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.doctorPanel, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
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

