import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class DarkButtonSquare extends StatelessWidget {
  const DarkButtonSquare({
    super.key,
    this.function,
    required this.text,
    this.heightButton = 55,
    this.widthButton = double.infinity,
  });
  final void Function()? function;
  final String text;
  final double heightButton;
  final double widthButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: widthButton,
        height: heightButton,
        decoration: BoxDecoration(
            color: AppColors.kdarkColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.kdarkColor, width: 2.0)
        ),
        child: Center(
          child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 14),),),
      ),
    );
  }
}

