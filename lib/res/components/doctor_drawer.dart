import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/logout_alert.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_panel_controller.dart';

class DoctorDrawer extends StatelessWidget {
  const DoctorDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    DoctorPanelController controller = Get.find<DoctorPanelController>();
    return Drawer(
      backgroundColor: AppColors.klightTeal,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.kdarkColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(AppUrl.doctorPictures+controller.doctorDetail[0].docPhoto,),
                  radius: 40,
                ),
                const SizedBox(height: 5,),
                Obx(()=>Text(
                  controller.doctorDetail[0].docName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(height: 3,),
                Text(
                  controller.doctorDetail[0].docSpeciality,
                  style: const TextStyle(
                    color: AppColors.kwhiteSmoke,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(RoutesNames.doctorProfile, arguments: controller.doctorID);
                },
                child: const ListTile(
                  leading: Icon(CupertinoIcons.person_crop_circle_fill, color: AppColors.kdarkColor,),
                  title: Text('My Profile'),
                  trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                  tileColor: AppColors.kwhite,
                ),
              ),
              const SizedBox(height: 3,),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.userDoctor, color: AppColors.kdarkColor,),
                title: Text('Doctors'),
                trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
              const ListTile(
                leading: Icon(CupertinoIcons.creditcard, color: AppColors.kdarkColor,),
                title: Text('My Payments'),
                trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.hospitalUser, color: AppColors.kdarkColor,),
                title: Text('Patients'),
                trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.bedPulse, color: AppColors.kdarkColor,),
                title: Text('Schedule Patients'),
                trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
              const ListTile(
                leading: Icon(CupertinoIcons.settings, color: AppColors.kdarkColor,),
                title: Text('Settings'),
                trailing: FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
              ListTile(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutAlert(
                        signOutFunction: (){
                          Get.offNamedUntil(RoutesNames.login, (route) => false);
                        },
                        cancelFunction: (){
                          Get.back();
                        },
                      );
                    },
                  );
                },
                leading: const Icon(
                  CupertinoIcons.square_arrow_left, color: AppColors.kdarkColor,),
                title: const Text('Logout'),
                trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                tileColor: AppColors.kwhite,
              ),
              const SizedBox(height: 3,),
            ],
          ),
        ],
      ),
    );
  }
}