
import 'package:get/get.dart';
import 'package:medics/models/category_model.dart';
import 'package:medics/models/doctor_profile_model.dart';
import 'package:medics/repository/home_screen_repository.dart';

class HomeController extends GetxController{
  final HomeRepository _homeCat = HomeRepository();

  Rx<bool> isLoading = true.obs;
  List<CategoryModel> categoryList = <CategoryModel>[].obs;
  List<DoctorProfileModel> doctorsList = <DoctorProfileModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDoctorProfile();
    fetchCategory();
  }
  void fetchCategory()async{
    try{
      isLoading(true);
      var responseData = await _homeCat.fetchCategoryApi();
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
      var responseData = await _homeCat.fetchDoctorProfile();
      doctorsList.assignAll(responseData);
    }
    finally{
      isLoading(false);
    }
  }
}