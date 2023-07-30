import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/components/doctor_profile_horizontal.dart';
import 'package:medics/res/components/menu_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/view_models/controller/home_controller/home_controller.dart';


class TopDoctors extends StatefulWidget {
  const TopDoctors({Key? key}) : super(key: key);

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Doctors'),
        centerTitle: true,
        actions: const [
          MenuButton(),
        ],
      ),
      body: Obx(()=>ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Get.find<HomeController>().doctorsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, left: AppConstants.kpaddingLR, right: AppConstants.kpaddingLR),
            child: DoctorProfileHorizontal(
              imagePath: Get.find<HomeController>().doctorsList[index].docPhoto.toString(),
              drName: Get.find<HomeController>().doctorsList[index].docName.toString(),
              speciality: Get.find<HomeController>().doctorsList[index].docSpeciality.toString(),
              rating: '4,7',
              distance: '800m away',
            ),
          );
        },
      ),),
    );
  }
}


