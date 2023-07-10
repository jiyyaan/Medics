import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.obscText,
    required this.suffixIcon,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.autoValidateMode,
    this.validator,
    this.focusNode,
    this.labelText,
    this.heightField,
  });

  final bool obscText;
  final Widget suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? labelText;
  final double? heightField;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightField,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        autovalidateMode: autoValidateMode,
        obscureText: obscText,
        cursorColor: Colors.black,
        showCursor: true,
        obscuringCharacter: "●",
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          color: Color(0xff191919),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: labelText,
          filled: true,
          fillColor: AppColors.kwhiteSmoke,
          prefixIcon: const Icon(
            Icons.lock_outline,
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color(0xffcccccc),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: AppColors.kdarkColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}