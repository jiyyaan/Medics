import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/routes_names.dart';
import '../../res/app_urls/app_urls.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAllNamed(RoutesNames.onBoarding);
      // Get.offAllNamed(RoutesNames.pharmacyHome);
      // Get.offAllNamed(RoutesNames.login);
      // Get.offAllNamed(RoutesNames.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.kdarkColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.0,
              height: 300.0,
              child: Image.network("${AppUrl.logos}medics-logo.png"),
              // Image.asset('images/medics-logo.png'),
            ),
            const SizedBox(height: 30.0,),
            const CircularProgressIndicator(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
