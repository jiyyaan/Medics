import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class SignInWith extends StatelessWidget {
  const SignInWith({Key? key, required this.function, required this.text, required this.path}) : super(key: key);
  final function;
  final String text;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.klightGrey, width: 1.5)
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
                child: Image.asset(path, width: 25, height: 25),),
            Center(
              child: Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}

