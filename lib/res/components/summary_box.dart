import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/constants/constants.dart';

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    super.key,
    required this.iconTitle,
    required this.title,
    required this.total,
  });
  final IconData iconTitle;
  final String title;
  final String total;
  @override
  Widget build(BuildContext context) {
    const double heightContainer = 100.0;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: heightContainer,
        decoration: BoxDecoration(
          color: AppColors.klightTeal,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(iconTitle, size: 30, color: AppColors.kdarkColor,),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
            Text(total, style: const TextStyle(color: AppColors.kdarkColor, fontWeight: FontWeight.bold, fontSize: 20,),),
          ]
          ,),
      ),
    );
  }
}