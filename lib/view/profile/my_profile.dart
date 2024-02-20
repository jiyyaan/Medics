import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/components/logout_alert.dart';
import 'package:medics/res/routes/routes_names.dart';
import '../../res/app_urls/app_urls.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.kdarkColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60,),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: const ColorFilter.srgbToLinearGamma(),
              alignment: const Alignment(15, -3),
              image: NetworkImage("${AppUrl.backgroundPictures}elipse.png"),
            ),
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Patient Image
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('${AppUrl.patientPictures}Dr.Karsten.jpg'),
                      radius: 60,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Karsten Winegeart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: IntrinsicWidth(
                      stepHeight: 10,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heartPulse,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 3,
                                ),
                                child: Text(
                                  'Heart Rate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Text(
                                '215bpm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: VerticalDivider(thickness: 2, color: AppColors.klightTeal,),
                          ),
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.fire,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 3,
                                ),
                                child: Text(
                                  'Calories',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Text(
                                '756cal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: VerticalDivider(thickness: 2, color: AppColors.klightTeal,),
                          ),
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.dumbbell,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 3,
                                ),
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Text(
                                '103lbs',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30,),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading:
                        Container(
                          margin: const EdgeInsets.only(right: 20,),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.heart, color: AppColors.kdarkColor,),),
                        ),
                        title: const Text('My Saved'),
                        trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                        tileColor: AppColors.kwhite,
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      ListTile(
                        leading:
                        Container(
                          margin: const EdgeInsets.only(right: 20,),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.fileInvoice, color: AppColors.kdarkColor,),),
                        ),
                        title: const Text('Appointments'),
                        trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                        tileColor: AppColors.kwhite,
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      ListTile(
                        leading:
                        Container(
                          margin: const EdgeInsets.only(right: 20,),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.creditCard, color: AppColors.kdarkColor,),),
                        ),
                        title: const Text('Payment Method'),
                        trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                        tileColor: AppColors.kwhite,
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      ListTile(
                        leading:
                        Container(
                          margin: const EdgeInsets.only(right: 20,),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.commentDots, color: AppColors.kdarkColor,),),
                        ),
                        title: const Text('FAQs'),
                        trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                        tileColor: AppColors.kwhite,
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
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
                        leading:
                        Container(
                          margin: const EdgeInsets.only(right: 20,),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.klightTeal,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: FaIcon(FontAwesomeIcons.exclamation, color: AppColors.kredColor,),),
                        ),
                        title: const Text('Logout', style: TextStyle(color: AppColors.kredColor),),
                        trailing: const FaIcon(FontAwesomeIcons.angleRight,size: 14,),
                        tileColor: AppColors.kwhite,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        width: width,
      ),
    );
  }
}

