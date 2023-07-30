import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/alert_box.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_two_controller.dart';

class DoctorFormTwo extends StatelessWidget {
  const DoctorFormTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Education Detail', style: TextStyle(color: AppColors.kwhite),),
        foregroundColor: AppColors.kwhite,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Last Degree',
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text('Upload your Doctorate Degree', style: TextStyle(fontSize: 10),),
                  trailing: SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.file_upload_outlined),
                        Text('Upload', style: TextStyle(fontSize: 10, color: AppColors.kdarkGrey),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Last Degree',
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text('Upload your Doctorate Degree', style: TextStyle(fontSize: 10),),
                  trailing: SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.file_upload_outlined),
                        Text('Upload', style: TextStyle(fontSize: 10, color: AppColors.kdarkGrey),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Last Degree',
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text('Upload your Doctorate Degree', style: TextStyle(fontSize: 10),),
                  trailing: SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.file_upload_outlined),
                        Text('Upload', style: TextStyle(fontSize: 10, color: AppColors.kdarkGrey),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Card(
                child: ListTile(
                  title: Text(
                    'Last Degree',
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text('Upload your Doctorate Degree', style: TextStyle(fontSize: 10),),
                  trailing: SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.file_upload_outlined),
                        Text('Upload', style: TextStyle(fontSize: 10, color: AppColors.kdarkGrey),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Obx(
                      () => Checkbox(
                    focusNode: Get.find<DoctorFormTwoController>()
                        .checkBoxFocusNode,
                    checkColor: Colors.white,
                    value:
                    Get.find<DoctorFormTwoController>().isChecked.value,
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    onChanged: (bool? value) {
                      Get.find<DoctorFormTwoController>().isChecked.value =
                      !Get.find<DoctorFormTwoController>()
                          .isChecked
                          .value;
                    },
                  ),
                ),
                Expanded(
                  child: RichText(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      text: 'I agree to the medidoc ',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Terms of Services ',
                          style: const TextStyle(color: AppColors.kdarkColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/terms');
                            },
                        ),
                        const TextSpan(
                          text: 'and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(color: AppColors.kdarkColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: DarkButton(
                text: 'Submit',
                heightButton: 50,
                function: (){
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
