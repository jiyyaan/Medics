import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medics/res/colors/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.heightField,
    this.validator,
    this.controller,
    this.textInputAction,
    this.autoValidateMode,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
    this.labelText,
    this.onTap,
  });
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final double? heightField;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightField,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        autovalidateMode: autoValidateMode,
        controller: controller,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: inputFormatters,
        cursorColor: Colors.black,
        showCursor: true,
        style: const TextStyle(
          color: Color(0xff191919),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: labelText,
          filled: true,
          fillColor: AppColors.kwhiteSmoke,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kdarkGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: AppColors.ktextFieldBorderColor,
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