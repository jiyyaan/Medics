import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';


class AlertBox extends StatelessWidget {
  const AlertBox({
    super.key,
    required this.title,
    required this.desc,
    required this.buttonTitle,
    this.onTap,
  });
  final String title;
  final Widget desc;
  final String buttonTitle;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      iconPadding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      icon: Stack(alignment: Alignment.center, children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.kwhiteSmoke,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.check,
            size: 40,
          ),
        ),
      ]),
      iconColor: AppColors.kdarkColor,
      title: Text(title),
      content: desc,
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
          child: DarkButton(
            text: buttonTitle,
            function: onTap,
          ),
        ),
      ],
    );
  }
}