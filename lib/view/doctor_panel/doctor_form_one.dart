import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field_square.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_one_controller.dart';

class DoctorFormOne extends StatefulWidget {
  const DoctorFormOne({super.key});

  @override
  State<DoctorFormOne> createState() => _DoctorFormOneState();
}

class _DoctorFormOneState extends State<DoctorFormOne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<DoctorFormOneController>().importantNotice(context);
  }
  @override
  Widget build(BuildContext context) {
    DoctorFormOneController controller = Get.find<DoctorFormOneController>();

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text(
          "Basic Detail",
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
                              backgroundImage: (controller.selectedImage.value != null)?Image.file(
                                File(controller.selectedImage.value!.path.toString()),
                                fit: BoxFit.contain,).image:null,
                              child: (controller.selectedImage.value==null)?Text(
                                controller.nameController.value.text[0]
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.klightTeal),
                              ):null,
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
                        )),
                    InputFieldSquare(
                      prefixIcon: const Icon(CupertinoIcons.person_crop_circle),
                      labelText: 'Doctor Name',
                      controller: controller.nameController,
                      focusNode: controller.nameFocusNode,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InputFieldSquare(
                        prefixIcon: const Icon(CupertinoIcons.wand_rays),
                        labelText: 'Speciality',
                        controller: controller.specialityController,
                        focusNode: controller.specialityFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InputFieldSquare(
                        controller: controller.genderController,
                        focusNode: controller.genderFocusNode,
                        labelText: 'Gender',
                        prefixIcon: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: (controller.selectedGender.value ==
                                      Gender.male)
                                  ? const FaIcon(FontAwesomeIcons.mars)
                                  : const FaIcon(FontAwesomeIcons.venus),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('Male'),
                            ),
                            Radio(
                              activeColor: AppColors.kdarkColor,
                              value: Gender.male,
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectedGender.value = value!;
                                controller.gender.value = "1";
                              },
                            ),
                            const Text('Female'),
                            Radio(
                              activeColor: AppColors.kdarkColor,
                              value: Gender.female,
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectedGender.value = value!;
                                controller.gender.value = "0";
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InputFieldSquare(
                        prefixIcon:
                            const Icon(CupertinoIcons.phone_arrow_down_left),
                        labelText: 'Phone No.',
                        controller: controller.phoneController,
                        focusNode: controller.phoneFocusNode,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InputFieldSquare(
                        prefixIcon: const Icon(CupertinoIcons.calendar),
                        labelText: 'Date of Birth',
                        controller: controller.dobController,
                        focusNode: controller.dobFocusNode,
                        onTap: () {
                          controller.closeKeyboard();
                          controller.selectDate(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: InputFieldSquare(
                        prefixIcon: const Icon(CupertinoIcons.mail),
                        labelText: 'Email',
                        controller: controller.emailController,
                        focusNode: controller.emailFocusNode,
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
                      child: DarkButton(
                        text: 'Save & Next',
                        heightButton: 50,
                        function: () {
                          Get.find<DoctorFormOneController>()
                              .doctorFormOne(context);
                          // Get.toNamed(RoutesNames.doctorFormTwo);
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
