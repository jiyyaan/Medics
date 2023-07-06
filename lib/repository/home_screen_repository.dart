import 'package:medics/data/network/network_api_service.dart';
import 'package:medics/models/category_model.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/res/app_urls/app_urls.dart';

class HomeRepository {
  NetworkApiService networkApiService = NetworkApiService();

  Future<List<CategoryModel>> fetchCategoryApi() async {
    try {
      dynamic response =
      await networkApiService.getApiResponse(AppUrl.category);
      return categoryModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<List<DoctorProfileModel>> fetchDoctorProfile() async {
    try {
      dynamic response =
      await networkApiService.getApiResponse(AppUrl.doctorProfile);
      return doctorProfileModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}