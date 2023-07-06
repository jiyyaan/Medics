import 'package:flutter/material.dart';
import 'package:medics/res/assets/image_assets.dart';
import 'package:medics/res/colors/app_colors.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.catIcon,
    required this.catName,
  });
  final String catIcon;
  final String catName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.kwhiteSmoke, width: 2),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(MedicsImageAssets.baseIconURL+catIcon),
                Text(
                  catName,
                  style: const TextStyle(
                    color: Color(0xffcccccc),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
