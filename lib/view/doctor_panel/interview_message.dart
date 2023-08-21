
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_panel_controller.dart';

class InterviewMessage extends StatelessWidget {
  const InterviewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DoctorPanelController controller = Get.find<DoctorPanelController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Interview Message',style: TextStyle(color: AppColors.kwhite),),
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
                  child: Text('Dear ${controller.doctorDetail[0].docName}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),),
                const SizedBox(height: 12,),
                const Text('Your interview call letter will be send to your concerned email.'),
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