import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class LightButton extends StatelessWidget {
  const LightButton({Key? key, required this.function, required this.text}) : super(key: key);
  final function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.kdarkColor, width: 2.0)
        ),
        child: Center(
          child: Text(text,
            style: const TextStyle(color: AppColors.kdarkColor, fontSize: 20),),),
      ),
    );
  }
}
