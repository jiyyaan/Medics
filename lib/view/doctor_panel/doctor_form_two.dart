import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button_square.dart';
import 'package:medics/res/components/input_field_square.dart';
import 'package:medics/res/components/time_table_container.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view/doctor_panel/doctor_panel.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_two_controller.dart';


class DoctorFormTwo extends StatefulWidget {
  const DoctorFormTwo({super.key});

  @override
  State<DoctorFormTwo> createState() => _DoctorFormTwoState();
}

class _DoctorFormTwoState extends State<DoctorFormTwo> {
  @override
  Widget build(BuildContext context) {
    DoctorFormTwoController controller = Get.put(DoctorFormTwoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text(
          'Form-II',
          style: TextStyle(color: AppColors.kwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppConstants.kpaddingLR,
            right: AppConstants.kpaddingLR,
            top: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.klightTeal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                      'All fields are required.* \nFirst select your duty hours,  '
                      'on that time you have to be active with your patients.\n'
                      'Every session will be of 20 minutes'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  prefixIcon: const Icon(CupertinoIcons.money_dollar_circle),
                  labelText: 'Consultation fee',
                  controller: controller.feeController,
                  focusNode: controller.feeFocusNode,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  controller: controller.startingTimeController,
                  focusNode: controller.startingTimeFocusNode,
                  prefixIcon: const Icon(CupertinoIcons.time),
                  labelText: 'Starting Time',
                  onTap: () {
                    Utils.closeKeyboard();
                    controller.startingTime(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: InputFieldSquare(
                  controller: controller.endingTimeController,
                  focusNode: controller.endingTimeFocusNode,
                  prefixIcon: const Icon(CupertinoIcons.time),
                  labelText: 'Ending Time',
                  onTap: () {
                    Utils.closeKeyboard();
                    controller.endingTime(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: GestureDetector(
                      onTap: (){
                        if(controller.startingTimeController.text==""){
                          Utils.toastErrorMessage("Please Select Starting Time");
                          return;
                        }
                        if(controller.endingTimeController.text==""){
                          Utils.toastErrorMessage("Please Select Ending Time");
                          return;
                        }else{
                          controller.sessionList.assignAll(controller.calculateSessions(controller.startTime.value, controller.endTime.value),);
                        }
                      },
                      child: const Text('View Sessions',
                        style: TextStyle(color: AppColors.kdarkColor, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DarkButtonSquare(
                  text: 'Submit',
                  heightButton: 50,
                  function: () {
                    controller.doctorFormTwo(context);
                  },
                ),
              ),
              const Divider(
                thickness: 1.5,
                height: 50,
                color: AppColors.klightTeal,
              ),
              /// Session List
              SizedBox(
                height: 180,
                child: Obx((){
                  if(controller.sessionActive.isTrue){
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 170,
                        childAspectRatio: 2.8,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: controller.sessionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TimeTableContainer(
                          timeText: controller.convertTimeTo12HourFormat(controller.sessionList[index], context),
                          bgColor: AppColors.kwhite,
                          textColor: AppColors.kblack,
                          borderColor: AppColors.kdarkTeal,
                        );
                      },
                    );
                  }else{
                    return const Text('');
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
