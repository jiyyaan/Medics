import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/repository/auth_repository.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }
class SignupController extends GetxController {
  final _api = AuthRepository();

  Rx<Color?> leftColor = Rx<Color?>(null);
  Rx<Color?> rightColor = Rx<Color?>(null);
  Rx<double> xAlign = 0.0.obs;
  double leftAlign = -1.0;
  double rightAlign = 1.0;
  Color selectedColor = AppColors.kdarkColor;
  Color normalColor = AppColors.klightGrey;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    xAlign.value = leftAlign;
    leftColor.value = selectedColor;
    rightColor.value = normalColor;
  }

  final Rx<bool> isChecked = false.obs;
  final Rx<bool> showPassword = true.obs;
  Rx<String> gender = ('1').obs;
  final Rx<Gender> selectedGender = Gender.male.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<String> userRole = "1".obs;


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode genderFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode checkBoxFocusNode = FocusNode();

  /// Date Selector Method
  Future<String> selectDate(BuildContext context) async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
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

  void signupApi(BuildContext context) {
    bool? fields = isFieldEmpty();
    if(fields != false)
    {
      Map data = {
        'user_name': usernameController.value.text,
        'user_gender': gender.value,
        'user_dob': dobController.text,
        'user_email': emailController.value.text,
        'user_phone_no': phoneController.value.text,
        'user_password': passwordController.value.text,
        'user_role': userRole.value
      };
      _api.signupApi(data).then((value) {
        print(value);
        if (value["success"] == "false" && value["userType"] == "email")
        {
          Utils.errorDialog("This email is already registered!");
          emailFocusNode.requestFocus();
        }
        if (value["success"] == "false" && value["userType"] == "phone"){
          Utils.errorDialog("This phone number is already registered!");
          mobileFocusNode.requestFocus();
        }
        else if(value["success"] == "true" && value["userType"] == "[userType]")
        {
          Utils.successDialog("Account created sucessfully!", onclick: () {
            Get.offNamedUntil(RoutesNames.login, (route) => false);
          });
        }
      }).onError((error, stackTrace) {
        Utils.showSnackBar(context, error.toString());
      });
    }
  }

  bool isFieldEmpty(){
    if(usernameController.value.text == "")
    {
      Utils.toastMessage("Please enter user name");
      usernameFocusNode.requestFocus();
      return false;
    }
    if(emailController.value.text == "")
    {
      Utils.toastMessage("Please enter email");
      emailFocusNode.requestFocus();
      return false;
    }
    if(phoneController.value.text == "")
    {
      Utils.toastMessage("Please enter mobile number");
      mobileFocusNode.requestFocus();
      return false;
    }
    if(passwordController.value.text == "")
    {
      Utils.toastMessage("Please enter your password");
      passwordFocusNode.requestFocus();
      return false;
    }
    if(isChecked.value == false){
      Utils.toastMessage("Please accept Terms of Services");
      checkBoxFocusNode.requestFocus();
      return false;
    }
    else
    {
      return true;
    }
  }
}
