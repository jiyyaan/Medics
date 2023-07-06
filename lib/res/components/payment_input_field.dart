import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medics/res/colors/app_colors.dart';

class PaymentInputField extends StatelessWidget {
  const PaymentInputField({
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightField,
      child: TextFormField(
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: AppColors.kwhite,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kdarkGrey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffcccccc),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kdarkColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
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