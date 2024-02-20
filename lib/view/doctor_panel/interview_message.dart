import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/interview_message_controller.dart';

class InterviewMessage extends StatelessWidget {
  const InterviewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    InterviewMessageController controller = Get.find<InterviewMessageController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Interview Message',style: TextStyle(color: AppColors.kwhite),),
        iconTheme: const IconThemeData(
          color: AppColors.kwhite,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: (){
                Get.offNamedUntil(RoutesNames.login, (route) => false);
              },
              child: const Icon(Icons.logout, color: AppColors.kwhite,),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
        child: Card(
          color: AppColors.klightTeal,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: width,
            height: 200,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(()=>Text('Dear ${controller.name.value}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),),
                ),
                const SizedBox(height: 12,),
                Obx(()=>RichText(
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    text: 'Your interview call letter will be send to your concerned email ',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: controller.email.value.toString(),
                        style: const TextStyle(
                          color: AppColors.kdarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Regards!', style: TextStyle(fontWeight: FontWeight.bold),),),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Medics'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}