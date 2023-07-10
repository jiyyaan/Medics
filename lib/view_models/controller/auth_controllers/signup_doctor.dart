import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/repository/auth_repository.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';

class SignupDoctorController extends GetxController{
  final _api = AuthRepository();


  final Rx<bool> isChecked = false.obs;
  final Rx<bool> showPassword = true.obs;


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode checkBoxFocusNode = FocusNode();

  void signupApi(BuildContext context) {
    bool? fields = isFieldEmpty();
    if(fields != false)
    {
      Map data = {
        'user_name': usernameController.value.text,
        'user_email': emailController.value.text,
        'user_phone_no': phoneController.value.text,
        'user_password': passwordController.value.text,
      };
      _api.signupApi(data).then((value) {
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