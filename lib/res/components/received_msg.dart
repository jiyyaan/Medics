import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    super.key,
    required this.width, required this.msgDesc, required this.onTime,
  });

  final double width;
  final String msgDesc;
  final String onTime;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 12, left: 6, right: 6, bottom: 6),
              width: width * 0.6,
              decoration: const BoxDecoration(
                color: AppColors.kdarkColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
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
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              onTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                            Image.asset(
                              'assets/icons/double-tick.png',
                              scale: 35,
                              color: Colors.white,
                            ),
                          ],
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
    );
  }
}