import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({
    Key? key,
    this.signOutFunction,
    this.cancelFunction,
  }) : super(key: key);

  final signOutFunction;
  final cancelFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.kwhiteSmoke,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.logout,
              size: 40,
            ),
          ),
        ],
      ),
      iconColor: AppColors.kdarkColor,
      title: const Text('Are you sure to log out of your account?', style: TextStyle(fontSize: 16),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
          child: DarkButton(
            heightButton: 40,
            text: 'Log Out',
            function: signOutFunction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
              child: GestureDetector(
                onTap: cancelFunction,
                child: const Text(
            'Cancel',
            style: TextStyle(
                color: AppColors.kdarkColor,
                fontSize: 16,
            ),
          ),
              )),
        ),
      ],
    );
  }
}
