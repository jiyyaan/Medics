import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/res/assets/image_assets.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/welcome_screen_controller.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: PageView(
          controller: Get.find<WelcomeScreenController>().pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            if (value == 1) {
              Get.find<WelcomeScreenController>().authenticate();
            }
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset('images/green-logo.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Lets get started!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const Text(
                  'Login to enjoye the features we\'ve provided and stay healthy!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFc0c0c0),
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesNames.login);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.kwhiteSmoke,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Lottie.asset(
                        MedicsImageAssets.swipeUpAnim,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text('Swipe up'),
                ),
              ],
            ),
            Scaffold(
              body: Obx(
                () =>
                    Get.find<WelcomeScreenController>().fingerPrintActive.value
                        ? CustomProgressIndicator(width: width)
                        : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

