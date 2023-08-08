import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medics/res/colors/app_colors.dart';

class InputFieldSquare extends StatelessWidget {
  const InputFieldSquare({
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
    this.onTap,
    this.labelText,
    this.contentPadding = EdgeInsets.zero,
    this.minLines,
    this.maxLines,
    this.showCursor = true,
  });
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final double? heightField;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int? minLines;
  final int? maxLines;
  final bool? showCursor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightField,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        focusNode: focusNode,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        validator: validator,
        autovalidateMode: autoValidateMode,
        controller: controller,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: inputFormatters,
        cursorColor: Colors.black,
        showCursor: showCursor,
        style: const TextStyle(
          color: Color(0xff191919),
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          labelText: labelText,
          filled: true,
          fillColor: AppColors.kwhiteSmoke,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kdarkGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xffcccccc),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.kdarkColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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