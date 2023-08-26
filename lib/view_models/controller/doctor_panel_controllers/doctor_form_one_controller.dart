import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/repository/doctor_panel_repo.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';

class DoctorFormOneController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserRecord();
  }

  final _api = DoctorPanelRepositories();

  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<bool> isChecked = false.obs;
  Rx<String> gender = ('-1').obs;
  Rx<bool> isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> selectedFile = Rx<File?>(null);
  Rx<PlatformFile?> fileName = Rx<PlatformFile?>(null);
  Rx<String> ImageBase64 = "".obs;
  Rx<String> FileBase64 = "".obs;

  String sampleString =
      "As a Cardiologist, I am dedicated to helping individuals navigate their emotional and mental well-being. With years of experience in the field, I have honed my skills in providing compassionate care and guidance to those in need. My profile reflects a deep understanding of various psychological theories and therapeutic approaches, enabling me to tailor treatment plans to suit each individual's unique needs. Through evidence-based practices, I foster a safe and non-judgmental environment where clients can explore their thoughts, feelings, and behaviors. I am passionate about empowering individuals to develop healthier coping mechanisms, build resilience, and achieve personal growth. By fostering a collaborative and trusting therapeutic relationship, I strive to support my clients on their journey towards emotional wellness and a fulfilling life.";

  /// User Record
  final String userID = Get.arguments;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode specialityFocusNode = FocusNode();
  final FocusNode aboutFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode checkBoxFocusNode = FocusNode();


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
      ImageBase64.value = base64.encode(imagebytes);
    } else {
      return;
    }
  }
  /// Pick File
  void pickFile() async {
    FilePickerResult? returnedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );
    if (returnedFile != null) {
      selectedFile.value = File(returnedFile.files.single.path!);
      fileName.value = returnedFile.files.first;
      Uint8List? fileBytes = await selectedFile.value!.readAsBytes();
      if (kDebugMode) {
        print(fileBytes);
      }
      FileBase64.value = base64.encode(fileBytes);
      if (kDebugMode) {
        print(FileBase64.value);
      }
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
  void doctorFormOne(BuildContext context) {
    bool? fields = isFieldEmpty();
    if (fields != false) {
      Map data = {
        'userID': userID,
        'photo': ImageBase64.value,
        'speciality': specialityController.value.text,
        'about': aboutController.value.text,
        'address': addressController.value.text,
        'resume': FileBase64.value
      };
      _api.doctorFormOne(data).then((value) {
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
    if (aboutController.value.text == "") {
      Utils.toastErrorMessage("Please write paragraph about your speciality");
      aboutFocusNode.requestFocus();
      return false;
    }
    if (addressController.value.text == "") {
      Utils.toastErrorMessage("Please enter your Address");
      addressFocusNode.requestFocus();
      return false;
    }
    if (selectedFile.value == null) {
      Utils.toastErrorMessage("Please upload your Resume");
      return false;
    } else {
      return true;
    }
  }
}
