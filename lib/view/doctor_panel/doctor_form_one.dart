import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field_square.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_one_controller.dart';

class DoctorFormOne extends StatelessWidget {
  const DoctorFormOne({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorFormOneController controller = Get.find<DoctorFormOneController>();
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
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.kdarkColor,
                      child: Text('R', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.klightTeal),),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.klightTeal,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.kdarkColor),
                        ),
                        child: const Icon(CupertinoIcons.camera, color: AppColors.kdarkColor,size: 18,),
                      ),
                    ),
                  ],
                )
              ),
              const InputFieldSquare(
                prefixIcon: Icon(CupertinoIcons.person_crop_circle),
                labelText: 'Doctor Name',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: Icon(CupertinoIcons.wand_rays),
                  labelText: 'Speciality',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: Obx(
                        () => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: (controller.selectedGender.value == Gender.male)? const FaIcon(FontAwesomeIcons.mars) : const FaIcon(FontAwesomeIcons.venus),
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
                          },
                        ),
                        const Text('Female'),
                        Radio(
                          activeColor: AppColors.kdarkColor,
                          value: Gender.female,
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) {
                            controller.selectedGender.value = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: Icon(CupertinoIcons.phone_arrow_down_left),
                  labelText: 'Phone No.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  controller: controller.dobController,
                  prefixIcon: const Icon(CupertinoIcons.calendar),
                  labelText: 'Date of Birth',
                  onTap: (){
                    controller.closeKeyboard();
                    controller.selectDate(context);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: Icon(CupertinoIcons.mail),
                  labelText: 'Email',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: Icon(CupertinoIcons.location_solid),
                  labelText: 'Address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DarkButton(
                  text: 'Save & Next',
                  heightButton: 50,
                  function: (){
                    Get.toNamed(RoutesNames.doctorFormTwo);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
