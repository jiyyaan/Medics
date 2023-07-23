import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }
class DoctorFormOneController extends GetxController{
  Rx<bool> isChecked = false.obs;
  final Rx<Gender> selectedGender = Gender.male.obs;
  final FocusNode checkBoxFocusNode = FocusNode();
  Rx<DateTime> selectedDate = DateTime.now().obs;
  TextEditingController dobController = TextEditingController();

  /// Date Selector Method
  Future<String> selectDate(BuildContext context) async {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
    dobController.text = dateFormat.format(selectedDate.value);
    return dateFormat.format(selectedDate.value);
  }
  /// Close Keyboard
  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}