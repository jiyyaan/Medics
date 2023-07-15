import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medics/res/colors/app_colors.dart';

class ChatIcon extends StatelessWidget {
  const ChatIcon({
    super.key,
    this.function,
  });
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.kdarkColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.solidCommentDots,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}