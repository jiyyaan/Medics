import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/chat_icon.dart';
import 'package:medics/res/components/doctor_drawer.dart';
import 'package:medics/res/components/notification_icon_with_badge.dart';
import 'package:medics/res/components/patients_graph.dart';
import 'package:medics/res/components/summary_box.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';


class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  double left = 0.0;
  double top = 0.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      drawer: const DoctorDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.kwhite),
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Doctor Diandra', style: TextStyle(color: AppColors.kwhite),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: AppConstants.kpaddingLR),
            child: Row(
              children: [
                NotificationIconWithBadge(notficationsCount: '1',),
                SizedBox(width: 5,),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/doctors/Dr.Diandra.png',) ,
                ),
              ],
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 8, left: AppConstants.kpaddingLR, right: AppConstants.kpaddingLR),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              ///Summaries
              const Row(
                children: [
                  SummaryBox(
                    iconTitle: Icons.medical_services,
                    total: '213',
                    title: 'Patients',),
                  SizedBox(width: 8,),
                  SummaryBox(
                    iconTitle: Icons.calendar_month_sharp,
                    total: '5',
                    title: 'Schedule',),
                  SizedBox(width: 8,),
                  SummaryBox(
                    iconTitle: CupertinoIcons.money_dollar_circle_fill,
                    title: 'Earning',
                    total: '${AppConstants.dollarSign}1000',
                  ),
                ],
              ),
              /// Patient Graph
              const Padding(
                padding: EdgeInsets.only(top: 108,),
                child: PatientGraph(),
              ),
              ///Schedule
              Padding(
                padding: const EdgeInsets.only(top: 366),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                    ),
                    const SizedBox(height: 8,),
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'Liam',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Headache',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.klightGrey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                  'images/Dr.Karsten.jpg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidCalendarDays,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '26/06/2022',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '10:30 AM',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 8,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Confirmed',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'Liam',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Headache',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.klightGrey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                  'images/Dr.Karsten.jpg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidCalendarDays,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '26/06/2022',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '10:30 AM',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 8,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Confirmed',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'Liam',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Headache',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.klightGrey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                  'images/Dr.Karsten.jpg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidCalendarDays,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '26/06/2022',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '10:30 AM',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 8,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Confirmed',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'Liam',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Headache',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.klightGrey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(
                                  'images/Dr.Karsten.jpg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidCalendarDays,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '26/06/2022',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '10:30 AM',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 8,
                                color: Colors.greenAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Confirmed',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /// Draggable Chat Icon
              Positioned(
                left: left,
                top: top,
                child: GestureDetector(
                  onPanUpdate: (details){
                    left = max(0, left + details.delta.dx);
                    top = max(0, top + details.delta.dy);
                    setState(() {
                    });
                  },
                  onTap: (){
                    Get.toNamed(RoutesNames.messagesDoctor);
                  },
                  child: Stack(
                      children: [
                        const ChatIcon(),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.kredColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: Text('1',style: TextStyle(color: AppColors.kwhite, fontSize: 10,),),),
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
    );
  }
}
