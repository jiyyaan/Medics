import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view/onboarding/unboarding_content.dart';

import '../../res/app_urls/app_urls.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          GestureDetector(
            onTap: () {
              Get.offNamedUntil(RoutesNames.welcome, (route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.kdarkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Illustrations
                    Expanded(
                      child: Image.network(
                        AppUrl.onBoardingPictures + content[i].image,
                        fit: BoxFit.cover, // Adjust this property according to your requirement
                      ),
                    ),
                    ///Captions
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        content[i].caption,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          /// Dot List and Buttons
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                /// Dots
                Row(
                  children: listDots(currentIndex),
                ),
                const Spacer(),
                ///Button
                GestureDetector(
                  onTap: () {
                    if (currentIndex == content.length - 1) {
                      Navigator.pushReplacementNamed(context, '/welcome');
                    }
                    _pageController.nextPage(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: AppColors.kdarkColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> dotlist = [];
double index = 0;
List<Widget> listDots(int index) {
  dotlist = [];
  for (double i = 0; i < content.length; i++) {
    dotlist.add(
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          width: 35,
          height: 10,
          decoration: BoxDecoration(
            color: (index == i ? Colors.teal : const Color(0xFFb2e0e4)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
  return dotlist;
}
