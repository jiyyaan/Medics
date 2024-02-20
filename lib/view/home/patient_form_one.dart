import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/dark_button_square.dart';
import 'package:medics/res/components/input_field_square.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view_models/controller/patient_panel_controllers/patient_form_one_controller.dart';

class PatientFormOne extends StatelessWidget {
  const PatientFormOne({super.key});

  @override
  Widget build(BuildContext context) {
    PatientFormOneController controller = Get.find<PatientFormOneController>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text(
          "Patient Form One",
          style: TextStyle(color: AppColors.kwhite),
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
        child: CustomProgressIndicator(width: width),
      )
          : Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.kpaddingLR),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.kdarkColor,
                      backgroundImage: (controller.selectedImage.value !=
                          null)
                          ? Image.file(
                        File(controller.selectedImage.value!.path
                            .toString()),
                        fit: BoxFit.contain,
                      ).image
                          : null,
                      child: (controller.selectedImage.value == null)
                          ? Text(
                        controller.nameController.value.text[0]
                            .toUpperCase(),
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: AppColors.klightTeal),
                      )
                          : null,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(15),
                            border:
                            Border.all(color: AppColors.kdarkColor),
                          ),
                          child: const Icon(
                            CupertinoIcons.camera,
                            color: AppColors.kdarkColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InputFieldSquare(
                prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                labelText: 'Doctor Name',
                controller: controller.nameController,
                focusNode: controller.nameFocusNode,
                showCursor: false,
                onTap: () {
                  Utils.closeKeyboard();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: const Icon(CupertinoIcons.arrow_up_down),
                  labelText: 'Height (in inches)',
                  controller: controller.heightController,
                  focusNode: controller.heightFocusNode,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: const Icon(Icons.monitor_weight_outlined),
                  labelText: 'Weight (in kg)',
                  controller: controller.weightController,
                  focusNode: controller.weightFocusNode,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: const Icon(Icons.bloodtype),
                  labelText: 'Blood Group',
                  controller: controller.bloodGroupController,
                  focusNode: controller.bloodGroupFocusNode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: const Icon(CupertinoIcons.location_solid),
                  labelText: 'Address',
                  controller: controller.addressController,
                  focusNode: controller.addressFocusNode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DarkButtonSquare(
                  text: 'Submit',
                  heightButton: 50,
                  function: () {
                    controller.patientFormOne(context);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

