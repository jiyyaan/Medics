import 'package:flutter/cupertino.dart';

class DateBox extends StatelessWidget {
  const DateBox({
    super.key,
    required this.bgColor, required this.borderColor, required this.dayText, required this.dayTextColor, required this.dateText, required this.dateTextColor,
  });

  final Color bgColor;
  final Color borderColor;
  final String dayText;
  final Color dayTextColor;
  final String dateText;
  final Color dateTextColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 66,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Text(dayText,
            style: TextStyle(
                color: dayTextColor,
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
          Text( dateText,
            style: TextStyle(
                color: dateTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}