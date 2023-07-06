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
      iconPadding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
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
      title: Text('Are you sure to log out of your account?'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
          child: DarkButton(
            text: 'Log Out',
            function: signOutFunction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
              child: GestureDetector(
                onTap: cancelFunction,
                child: Text(
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
