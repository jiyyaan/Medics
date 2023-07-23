import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/models/booking_data.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/date_box.dart';
import 'package:medics/res/components/doctor_profile_horizontal.dart';
import 'package:medics/res/components/menu_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_profile_controller.dart';
import '../../res/components/time_table_container.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final DoctorProfileController controller = Get.find<DoctorProfileController>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kwhite,
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Doctor Profile', style: TextStyle(color: AppColors.kwhite),),
        centerTitle: true,
        actions: const [
          MenuButton(color: AppColors.kwhite, textColor: AppColors.kblack,),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kpaddingLR),
                  child: Obx(() {
                    if (Get.find<DoctorProfileController>()
                        .doctorDetail
                        .isNotEmpty) {
                      return Column(
                        children: <Widget>[
                          ///Doctor Profile
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DoctorProfileHorizontal(
                              imagePath: Get.find<DoctorProfileController>()
                                  .doctorDetail[0]
                                  .docPhoto,
                              drName: Get.find<DoctorProfileController>()
                                  .doctorDetail[0]
                                  .docName,
                              speciality: Get.find<DoctorProfileController>()
                                  .doctorDetail[0]
                                  .docSpeciality,
                              rating: Get.find<DoctorProfileController>()
                                  .doctorDetail[0]
                                  .docRatings,
                              distance: '800m away',
                              borderColor: Colors.transparent,
                            ),
                          ),
                          ///About
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  Get.find<DoctorProfileController>()
                                      .doctorDetail[0]
                                      .doctorAbout,
                                  textAlign: TextAlign.justify,
                                  overflow: Get.find<DoctorProfileController>()
                                      .isReadMore
                                      .value
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                                  maxLines: Get.find<DoctorProfileController>()
                                      .isReadMore
                                      .value
                                      ? null
                                      : 4,
                                  style: const TextStyle(
                                    color: AppColors.kdarkGrey,
                                    height: 1.5,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Get.find<DoctorProfileController>()
                                          .isReadMore
                                          .value =
                                      !Get.find<DoctorProfileController>()
                                          .isReadMore
                                          .value;
                                    });
                                  },
                                  child: Text(
                                    (Get.find<DoctorProfileController>()
                                        .isReadMore
                                        .value
                                        ? "Read less"
                                        : "Read more"),
                                    style: const TextStyle(
                                      color: AppColors.kdarkColor,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /// Date and Day Box
                          SizedBox(
                            height: 66,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Get.find<DoctorProfileController>()
                                  .datesList
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.dateIndex.value = index;
                                      controller.selectedDate.value = controller.datesList[index]['selectedDate'];
                                    },
                                    child: GetBuilder<DoctorProfileController>(
                                      builder: (controller) => Obx(
                                            () => DateBox(
                                          bgColor: (index ==
                                              controller.dateIndex.value)
                                              ? AppColors.kdarkColor
                                              : AppColors.kwhite,
                                          borderColor: (index ==
                                              controller.dateIndex.value)
                                              ? AppColors.kwhite
                                              : AppColors.klightTeal,
                                          dayText:
                                          Get.find<DoctorProfileController>()
                                              .datesList[index]['day'],
                                          dayTextColor: (index ==
                                              controller.dateIndex.value)
                                              ? AppColors.kwhite
                                              : AppColors.kdarkGrey,
                                          dateText:
                                          Get.find<DoctorProfileController>()
                                              .datesList[index]['date'],
                                          dateTextColor: (index ==
                                              controller.dateIndex.value)
                                              ? AppColors.kwhite
                                              : AppColors.kblack,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                            height: 50,
                            color: AppColors.klightTeal,
                          ),
                          /// Time List
                          SizedBox(
                            height: 190,
                            child: GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 170,
                                childAspectRatio: 2.8,
                                mainAxisSpacing: 4,
                              ),
                              itemCount: Get.find<DoctorProfileController>()
                                  .timeList
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                      () {
                                    if (int.parse(controller
                                        .timeList[index].status) ==
                                        1) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.timeIndex.value = index;
                                          controller.selectedTime.value =
                                              controller.twelveHourFormat(
                                                  controller.timeList[index]
                                                      .timeSession);
                                        },
                                        child: TimeTableContainer(
                                          timeText: controller.twelveHourFormat(
                                            controller
                                                .timeList[index].timeSession,
                                          ),
                                          bgColor: (index ==
                                              controller.timeIndex.value)
                                              ? AppColors.kdarkColor
                                              : AppColors.kwhite,
                                          textColor: (index ==
                                              controller.timeIndex.value)
                                              ? AppColors.kwhite
                                              : AppColors.kblack,
                                          fontWeight: (index ==
                                              controller.timeIndex.value)
                                              ? FontWeight.bold
                                              : null,
                                          borderColor: AppColors.kdarkTeal,
                                        ),
                                      );
                                    } else {
                                      return TimeTableContainer(
                                        timeText: controller.twelveHourFormat(
                                          controller
                                              .timeList[index].timeSession,
                                        ),
                                        bgColor: AppColors.kwhite,
                                        textColor: AppColors.klightTeal,
                                        borderColor: AppColors.klightTeal,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          /// Bottom Buttons
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RoutesNames.chatDoctor);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.klightTeal,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.chat,
                                        color: AppColors.kdarkColor,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: DarkButton(
                                    heightButton: 50,
                                    text: 'Book Appointment',
                                    function: () {
                                      BookingModel booking = BookingModel(
                                        doctorID: controller.doctorID,
                                        dateAppointment:
                                        controller.selectedDate.value,
                                        timeAppointment:
                                        controller.selectedTime.value,
                                      );
                                      if (booking.dateAppointment.isEmpty){
                                        Utils.toastErrorMessage('Please Select Date');
                                        return false;
                                      }
                                      if(booking.timeAppointment.isEmpty)
                                      {
                                        Utils.toastErrorMessage('Please select Time');
                                        return false;
                                      }else{
                                        Get.toNamed(RoutesNames.booking,
                                            arguments: booking);
                                        return true;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Center(child: CustomProgressIndicator(width: width,),),
                      );
                    }
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
