
import 'dart:convert';

import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class AuthRepository {
  NetworkApiService networkApiService = NetworkApiService();
  /// Login Repository
  Future<dynamic> loginApi(data) async {
    try {
      dynamic response =
          await networkApiService.postApiResponse(AppUrl.loginUrl, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Signup Repository
  Future<dynamic> signupApi(data) async {
    try {
      dynamic response =
          await networkApiService.postApiResponse(AppUrl.signupUrl, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///SignupDoctor Repository
  Future<dynamic> signupDoctorApi(data) async {
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.signupDoctorUrl, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  ///Login with Google Repository
  Future<dynamic> loginWithGoogle(data)async{
    try {
      dynamic response =
      await networkApiService.postApiResponse(AppUrl.loginWithGoogle, data);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}

