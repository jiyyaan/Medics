
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * 0.8,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.kwhiteSmoke,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: AppColors.kdarkTeal,
                color: AppColors.kdarkColor,
              ),
              Text('please wait...'),
            ],
          ),
        ),
      ),
    );
  }
}