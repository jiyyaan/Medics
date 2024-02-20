import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medics/repository/doctor_panel_repo.dart';


class InterviewMessageController extends GetxController {
  final doctorID = Get.arguments;
  final _api = DoctorPanelRepositories();
  Rx<String> name = ''.obs;
  Rx<String> email = ''.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNameWithEmail();
  }

  void getNameWithEmail() {
    isLoading.value = true;
    Map data = {
      'doctorID': doctorID
    };
    try {
      _api.interviewMessage(data).then((value) {
        print(data);
        name.value = value["name"];
        email.value = value["email"];
        isLoading.value = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }
}