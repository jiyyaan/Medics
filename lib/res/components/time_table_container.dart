import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

class TimeTableContainer extends StatelessWidget {
  const TimeTableContainer({
    super.key,
    required this.timeText,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
    this.fontWeight,
  });

  final Color? bgColor;
  final String timeText;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          timeText,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
