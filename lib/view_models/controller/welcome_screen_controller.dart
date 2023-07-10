import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  Rx<bool> fingerPrintActive = false.obs;
  Rx<bool> goToLogin = false.obs;
  late final LocalAuthentication auth;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) {});
  }

  ///Authentication Bottom Sheet
  Future authenticate() async {
    try {
      bool authenticate = await auth.authenticate(
          localizedReason: 'Please login to get access',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
            useErrorDialogs: true,
            sensitiveTransaction: true,
          ));
      if (authenticate == true) {
        fingerPrintActive.value = !fingerPrintActive.value;
        Future.delayed(const Duration(seconds: 2), () {
          Get.offNamedUntil(RoutesNames.home, (route) => false);
        });
      } else {
        goToLogin.value = !goToLogin.value;
        Future.delayed(const Duration(seconds: 2), () {
          Get.toNamed(RoutesNames.login);
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
    return authenticate;
  }

  ///Check that Biometric is Enable
  Future<void> getBiometric(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool("biometric");
    if (value == true) {
      authenticate();
    } else {
      Get.toNamed(RoutesNames.login);
    }
  }
}
