import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medics/repository/auth_repository.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';

class LoginController extends GetxController{

  final _api = AuthRepository();
  final Rx<bool> showPassword = true.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();


  ///Check all the fields are filled
  bool isFieldEmpty(){
    if(usernameController.value.text == "")
    {
      Utils.toastMessage("Please enter username");
      usernameFocusNode.requestFocus();
      return false;
    }
    if(passwordController.value.text == "")
    {
      Utils.toastMessage("Please enter your password");
      passwordFocusNode.requestFocus();
      return false;
    }
    else
    {
      return true;
    }
  }

  /// Login with username or mobile
  void loginApi(){
    bool? fields = isFieldEmpty();
    if(fields != false) {
      Map data = {
        'username': usernameController.value.text,
        'password': passwordController.value.text,
      };
      _api.loginApi(data).then((value) {
        if (value["status"] == "false" && value["errorField"] == "password") {
          Utils.errorDialog(value["message"].toString());
          passwordFocusNode.requestFocus();
        }
        if (value["status"] == "false" && value["errorField"] == "username") {
          Utils.errorDialog(value["message"].toString());
          usernameFocusNode.requestFocus();
        }
        else if (value["status"] == "true" &&
            value["errorField"] == "[errorField]") {
          Utils.successDialog(value["message"].toString());
          Get.offNamedUntil(RoutesNames.home, (route) => false);
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }
  }

}