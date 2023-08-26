import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/repository/patient_panel_repo.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';

class PatientFormOneController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserRecord();
  }

  final _api = PatientPanelRepositories();
  Rx<bool> isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<String> imageBase64 = "".obs;

  /// User Record
  final String userID = Get.arguments;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();
  final FocusNode weightFocusNode = FocusNode();
  final FocusNode bloodGroupFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  /// Pick Image
  void pickImage() async {
    FilePickerResult? returnedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg','png','jpeg'
      ],
    );
    if (returnedFile != null) {
      selectedImage.value = File(returnedFile.files.single.path!);
      Uint8List imagebytes = await selectedImage.value!.readAsBytes();
      imageBase64.value = base64.encode(imagebytes);
    } else {
      return;
    }
  }

  /// Get user record
  void getUserRecord() {
    isLoading.value = true;
    Map data = {'userID': userID};
    try {
      _api.getUserRecord(data).then((value) {
        ///For Fields
        nameController.text = (value[0]["user_name"]);
        isLoading.value = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }

  /// Doctor Form One
  void patientFormOne(BuildContext context) {
    bool? fields = isFieldEmpty();
    if (fields != false) {
      Map data = {
        'userID': userID,
        'photo': imageBase64.value,
        'height': heightController.value.text,
        'weight': weightController.value.text,
        'bloodGroup': bloodGroupController.value.text,
        'address': addressController.value.text
      };
      _api.patientFormOne(data).then((value) {
        if (value["success"] == "true") {
          Utils.toastMessage(value["message"]);
          Get.toNamed(
            RoutesNames.doctorPanel,
            arguments: userID,
          );
        } else {
          Utils.toastErrorMessage(value["message"]);
          if (kDebugMode) {
            print(value["message"]);
          }
        }
      }).onError((error, stackTrace) {
        Utils.showSnackBar(context, error.toString());
      });
    }
  }

  /// Field checking method isEmpty or Not
  bool isFieldEmpty() {
    if (selectedImage.value == null) {
      Utils.toastErrorMessage("Please Select Image");
      return false;
    }
    if (nameController.value.text == "") {
      Utils.toastErrorMessage("Please enter your name");
      nameFocusNode.requestFocus();
      return false;
    }
    if (heightController.value.text == "") {
      Utils.toastErrorMessage("Please enter your height");
      heightFocusNode.requestFocus();
      return false;
    }
    if (weightController.value.text == "") {
      Utils.toastErrorMessage("Please enter your weight");
      weightFocusNode.requestFocus();
      return false;
    }
    if (bloodGroupController.value.text == "") {
      Utils.toastErrorMessage("Please enter your Blood Group");
      bloodGroupFocusNode.requestFocus();
      return false;
    }
    if (addressController.value.text == "") {
      Utils.toastErrorMessage("Please enter your address");
      addressFocusNode.requestFocus();
      return false;
    } else {
      return true;
    }
  }
}
