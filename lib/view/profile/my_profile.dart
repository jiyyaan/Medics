import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/main.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/components/logout_alert.dart';
import 'package:medics/res/routes/routes_names.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              alignment: Alignment(15, -3),
              image: AssetImage(
                'images/elipse.png',
              ),
            ),
          ),
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Dr.Karsten.jpg'),
                      radius: 60,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Karsten Winegeart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
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
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20,),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: FaIcon(FontAwesomeIcons.heart, color: AppColors.kdarkColor,),),
                          ),
                          const Text('My Saved', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                          const Spacer(),
                          const FaIcon(FontAwesomeIcons.angleRight,),
                        ],
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20,),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: FaIcon(FontAwesomeIcons.fileInvoice, color: AppColors.kdarkColor,),),
                          ),
                          const Text('Appointment', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                          const Spacer(),
                          const FaIcon(FontAwesomeIcons.angleRight,),
                        ],
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20,),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: FaIcon(FontAwesomeIcons.creditCard, color: AppColors.kdarkColor,),),
                          ),
                          const Text('Payment Method', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                          const Spacer(),
                          const FaIcon(FontAwesomeIcons.angleRight,),
                        ],
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20,),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.klightTeal,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: FaIcon(FontAwesomeIcons.commentDots, color: AppColors.kdarkColor,),),
                          ),
                          const Text('FAQs', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                          const Spacer(),
                          const FaIcon(FontAwesomeIcons.angleRight,),
                        ],
                      ),
                      const Divider(thickness: 1.5, color: AppColors.klightTeal,),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LogoutAlert(
                                signOutFunction: (){
                                  Get.offNamedUntil(RoutesNames.login, (route) => false);
                                },
                                cancelFunction: (){
                                  navigatorKey.currentState!.pop();
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20, bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.klightTeal,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(child: FaIcon(FontAwesomeIcons.exclamation, color: Colors.red,),),
                            ),
                            const Text('Logout', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold,),),
                            const Spacer(),
                            const FaIcon(FontAwesomeIcons.angleRight,),
                          ],
                        ),
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

