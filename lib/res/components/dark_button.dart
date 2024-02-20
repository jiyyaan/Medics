import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/constants/constants.dart';

class DarkButton extends StatelessWidget {
  DarkButton({
    super.key,
    this.function,
    required this.text,
    this.heightButton = 55,
    this.widthButton = double.infinity,
  });
  final function;
  final String text;
  double heightButton;
  double widthButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: widthButton,
        height: heightButton,
        decoration: BoxDecoration(
            color: AppColors.kdarkColor,
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusAll),
            border: Border.all(color: AppColors.kdarkColor, width: 2.0)
        ),
        child: Center(
            child: Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 14),),),
      ),
    );
  }
}

