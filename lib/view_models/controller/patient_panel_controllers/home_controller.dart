
import 'package:get/get.dart';
import 'package:medics/models/category_model.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/models/patient_profile_model.dart';
import 'package:medics/repository/patient_panel_repo.dart';

class HomeController extends GetxController{
  final PatientPanelRepositories _api = PatientPanelRepositories();
  final patientID = Get.arguments;
  Rx<bool> isLoading = true.obs;
  List<CategoryModel> categoryList = <CategoryModel>[].obs;
  List<DoctorProfileModel> doctorsList = <DoctorProfileModel>[].obs;
  List<PatientProfileModel> patientDetail = <PatientProfileModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDoctorProfile();
    fetchCategory();
    fetchPatientDetail();
  }
  /// Fetch Category
  void fetchCategory()async{
    try{
      isLoading(true);
      var responseData = await _api.fetchCategoryApi();
      categoryList.assignAll(responseData);
    }
    finally{
      isLoading(false);
    }
  }
  /// Fetch Doctors Profile
  void fetchDoctorProfile()async{
    try{
      isLoading(true);
      var responseData = await _api.fetchDoctorProfile();
      doctorsList.assignAll(responseData);
    }
    finally{
      isLoading(false);
    }
  }
  /// Fetch Patient Detail
  void fetchPatientDetail()async{
    Map data = {
      'patientID': patientID
    };
    try{
      isLoading(true);
      var responseData = await _api.fetchPatientDetail(data);
      patientDetail.assignAll(responseData);
    }
    finally{
      isLoading(false);
    }
  }
}