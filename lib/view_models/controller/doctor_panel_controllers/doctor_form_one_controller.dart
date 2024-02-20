import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
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
  final Rx<String> name = "".obs;
  final Rx<String> email = "".obs;

  Rx<bool> isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> selectedFile = Rx<File?>(null);
  Rx<PlatformFile?> fileName = Rx<PlatformFile?>(null);
  Rx<String> imageBase64 = "".obs;
  Rx<String> fileBase64 = "".obs;


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
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (returnedFile != null) {
      selectedImage.value = File(returnedFile.files.single.path!);
      cropImage();
    } else {
      return;
    }
  }

  /// Image Cropper
  Future cropImage() async {
    if (selectedImage.value != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
          sourcePath: selectedImage.value!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop',
                cropGridColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(title: 'Crop')
          ]);

      if (cropped != null) {
        selectedImage.value = File(cropped.path);
        Uint8List imageBytes = await selectedImage.value!.readAsBytes();
        imageBase64.value = base64.encode(imageBytes);
      }
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
      fileBase64.value = base64.encode(fileBytes);
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
        name.value = (value[0]["user_name"]);
        email.value = (value[0]["user_email"]);
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
        'name': name.value,
        'email': email.value,
        'userID': userID,
        'photo': imageBase64.value,
        'speciality': specialityController.value.text,
        'about': aboutController.value.text,
        'address': addressController.value.text,
        'resume': fileBase64.value
      };
      _api.doctorFormOne(data).then((value) {
        if (value["success"] == "true") {
          Utils.toastMessage(value["message"]);
          Get.offNamedUntil(RoutesNames.interviewMsg,
              arguments: value["doctorID"], (route) => false);
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
