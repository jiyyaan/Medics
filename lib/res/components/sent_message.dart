import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({
    super.key,
    required this.width, required this.imagePath, required this.nameDr, required this.timeWas, required this.msgDesc, required this.onTime,
  });

  final double width;
  final String imagePath;
  final String nameDr;
  final String timeWas;
  final String msgDesc;
  final String onTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.klightTeal,
                backgroundImage: AssetImage(
                  imagePath,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 5),
                  child: Text(
                    nameDr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  timeWas,
                  style: const TextStyle(
                    color: AppColors.klightGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 12, left: 6, right: 6, bottom: 6),
                width: width * 0.6,
                decoration: const BoxDecoration(
                  color: AppColors.klightTeal,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            msgDesc,
                            style: const TextStyle(
                              height: 1.5,
                              color: Color(0xff555555),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            onTime,
                            style: const TextStyle(
                              color: Color(0xff555555),
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}