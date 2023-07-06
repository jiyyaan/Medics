
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/routes_names.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: width,
      decoration: const BoxDecoration(color: AppColors.kwhiteSmoke),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(RoutesNames.home);
            },
            child: const Icon(
              Icons.home,
              size: 27,
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(RoutesNames.messagesDoctor);
            },
            child: const Icon(
              Icons.mail,
              size: 27,
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(RoutesNames.scheduleDoctor);
            },
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 27,
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.offAndToNamed(RoutesNames.myProfile);
            },
            child: const Icon(
              Icons.person,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
