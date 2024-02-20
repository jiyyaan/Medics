import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';

class DisplayAdd extends StatelessWidget {
  const DisplayAdd({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.17,
      decoration: BoxDecoration(
        color: AppColors.kwhiteSmoke,
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE4F8F0),
            Color(0xFFFFFFFF),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              5, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const Expanded(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        'Early protection for \n your family health',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.only(bottom: 20, left: 25),
                  child: DarkButton(
                    text: 'Learn more',
                    heightButton: 40,
                    widthButton: 130,
                    function: () {},
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.network('${AppUrl.doctorAds}ad-dr.png'),
          ),
        ],
      ),
    );
  }
}