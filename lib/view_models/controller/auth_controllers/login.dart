import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      try{
        _api.loginApi(data).then((value) {
          if (value["status"] == "false" && value["errorField"] == "password") {
            Utils.errorDialog(value["message"].toString());
            passwordFocusNode.requestFocus();
          }
          if (value["status"] == "false" && value["errorField"] == "username") {
            Utils.errorDialog(value["message"].toString());
            usernameFocusNode.requestFocus();
          }
          if (value["status"] == "true" &&
              value["errorField"] == "[errorField]" &&
              value["userRole"] == "1"
          ) {
            String userID = value["userID"];
            checkPatientRecord(userID);
          }
          else if (value["status"] == "true" &&
              value["errorField"] == "[errorField]" &&
              value["userRole"] == "2"
          ) {
            String userID = value["userID"];
            checkDoctorRecord(userID);
          }
        });
      }catch (e){
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }
  ///Check Doctor Record
  void checkDoctorRecord(String userID) {
    Map data = {
      'userID': userID
    };
    try{
      _api.doctorPanel(data).then((value) {
        if (value["success"] == "true"){
          if(value["docStatus"] == "0"){
            Get.offNamedUntil(RoutesNames.interviewMsg, arguments: value["doctorID"], (route) => false);
          }else if(value["consultFee"] == "0" ||value["consultFee"] == ""){
            Get.offNamedUntil(RoutesNames.doctorFormTwo, arguments: value["doctorID"], (route) => false);
          }else{
            Get.offNamedUntil(RoutesNames.doctorPanel, arguments: value["doctorID"], (route) => false);
          }
        }
        else if (value["success"] == "false"){
          Get.offNamedUntil(RoutesNames.doctorFormOne, arguments: userID, (route) => false);
        }
      });
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  ///Check Doctor Record
  void checkPatientRecord(String userID) {
    Map data = {
      'userID': userID
    };
    try{
      _api.patientPanel(data).then((value) {
        if (value["success"] == "false"){
          Get.offNamedUntil(RoutesNames.patientFormOne, arguments: userID, (route) => false);
        }
        else if (value["success"] == "true"){
          Get.offNamedUntil(RoutesNames.patientPanel, arguments: value["patientID"], (route) => false);
        }
      });
    }catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}