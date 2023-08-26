import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/chat_icon.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/docto_bottom.dart';
import 'package:medics/res/components/doctor_drawer.dart';
import 'package:medics/res/components/notification_icon_with_badge.dart';
import 'package:medics/res/components/patients_graph.dart';
import 'package:medics/res/components/summary_box.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/view/doctor_panel/doctor_form_two.dart';
import 'package:medics/view/doctor_panel/interview_message.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_panel_controller.dart';

class DoctorPanel extends StatelessWidget {
  const DoctorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    DoctorPanelController controller = Get.find<DoctorPanelController>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller.doctorDetail.isEmpty
          ? CustomProgressIndicator(width: width)
          : (controller.doctorDetail[0].docStatus == "0")
              ? const InterviewMessage()
              : (controller.doctorDetail[0].consultationFee == "0" ||
                      controller.doctorDetail[0].consultationFee == "")
                  ? const DoctorFormTwo()
                  : const DoctorPanelHome(),
    );
  }
}

class DoctorPanelHome extends StatelessWidget {
  const DoctorPanelHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DoctorPanelController controller = Get.find<DoctorPanelController>();
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      drawer: const DoctorDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.kwhite),
        backgroundColor: AppColors.kdarkColor,
        title: Obx(
          () => Text(
            controller.doctorDetail[0].docName,
            style: const TextStyle(color: AppColors.kwhite),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppConstants.kpaddingLR),
            child: Row(
              children: [
                const NotificationIconWithBadge(
                  notficationsCount: '1',
                ),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    AppUrl.doctorPictures + controller.doctorDetail[0].docPhoto,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 8,
            left: AppConstants.kpaddingLR,
            right: AppConstants.kpaddingLR),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              /// All Screen Widgets merged in one column
              Column(
                children: [
                  ///Summaries
                  const Row(
                    children: [
                      SummaryBox(
                        iconTitle: Icons.medical_services,
                        total: '213',
                        title: 'Patients',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SummaryBox(
                        iconTitle: Icons.calendar_month_sharp,
                        total: '5',
                        title: 'Schedule',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SummaryBox(
                        iconTitle: CupertinoIcons.money_dollar_circle_fill,
                        title: 'Earning',
                        total: '${AppConstants.dollarSign}1000',
                      ),
                    ],
                  ),

                  /// Patient Graph
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: PatientGraph(),
                  ),

                  ///Schedule
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Schedule',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: width,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.klightTeal, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 14,
                                            color: AppColors.klightGrey),
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
                              SizedBox(
                                height: 5,
                              ),
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
                            border: Border.all(
                                color: AppColors.klightTeal, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 14,
                                            color: AppColors.klightGrey),
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
                              SizedBox(
                                height: 5,
                              ),
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
                            border: Border.all(
                                color: AppColors.klightTeal, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 14,
                                            color: AppColors.klightGrey),
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
                              SizedBox(
                                height: 5,
                              ),
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
                            border: Border.all(
                                color: AppColors.klightTeal, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            fontSize: 14,
                                            color: AppColors.klightGrey),
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
                              SizedBox(
                                height: 5,
                              ),
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
                ],
              ),

              /// Draggable Chat Icon
              Obx(
                () => Positioned(
                  left: controller.left.value,
                  top: controller.top.value,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      controller.left.value =
                          max(0, controller.left.value + details.delta.dx);
                      controller.top.value =
                          max(0, controller.top.value + details.delta.dy);
                      controller.setPosition();
                    },
                    onTap: () {
                      // Get.toNamed(RoutesNames.messagesDoctor);
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
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: AppColors.kwhite,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DoctorBottomNavigation(width: width),
    );
  }
}
