import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/constants/constants.dart';


class ScheduleDoctors extends StatefulWidget {
  const ScheduleDoctors({Key? key}) : super(key: key);

  @override
  State<ScheduleDoctors> createState() => _ScheduleDoctorsState();
}

const double upcomingAlign = -1;
const double completedAlign = 0;
const double canceledAlign = 1;
const String upcomingText = "Upcoming";
const String completedText = "Completed";
const String canceledText = "Canceled";
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black;

class _ScheduleDoctorsState extends State<ScheduleDoctors> {
  double? xAlign;
  Color? upcomingColor;
  Color? completedColor;
  Color? canceledColor;
  String? hintText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    xAlign = upcomingAlign;
    upcomingColor = selectedColor;
    completedColor = normalColor;
    canceledColor = normalColor;
    hintText = upcomingText;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Schedule'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
          child: Column(
            children: [
              Container(
                width: width,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.klightTeal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: Alignment(xAlign!, 0),
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: width / 3.5,
                        decoration: const BoxDecoration(
                          color: AppColors.kdarkColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = upcomingAlign;
                          upcomingColor = selectedColor;
                          completedColor = normalColor;
                          canceledColor = normalColor;
                          hintText = upcomingText;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(-1, 0),
                        child: Container(
                          width: width / 3.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: upcomingColor,
                              fontSize: 16,
                            ),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = completedAlign;
                          upcomingColor = normalColor;
                          completedColor = selectedColor;
                          canceledColor = normalColor;
                          hintText = completedText;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(0, 0),
                        child: Container(
                          width: width / 3.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Completed',
                            style: TextStyle(
                              color: completedColor,
                              fontSize: 16,
                            ),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = canceledAlign;
                          upcomingColor = normalColor;
                          completedColor = normalColor;
                          canceledColor = selectedColor;
                          hintText = canceledText;
                        });
                      },
                      child: Align(
                        alignment: const Alignment(1, 0),
                        child: Container(
                          width: width / 3.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child: Text(
                            'Canceled',
                            style: TextStyle(
                              color: canceledColor,
                              fontSize: 16,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: 170,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Row(
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
                                        'Dr.Marcus Horizon',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Cardiologist',
                                      style: TextStyle(
                                          fontSize: 14, color: AppColors.klightGrey),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    'images/Dr.Marcus.png',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Row(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: (width - 60) / 2.5,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.klightTeal,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kdarkGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: (width - 60) / 2.5,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.kdarkColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Reschedule',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      bottomNavigationBar: BottomNavigation(width: width,),
    );
  }
}
