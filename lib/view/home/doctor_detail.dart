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
import 'package:medics/view_models/controller/home_controller/doctor_detail_controller.dart';
import '../../res/components/time_table_container.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({Key? key}) : super(key: key);

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  final DoctorDetailController controller = Get.find<DoctorDetailController>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Detail'),
        centerTitle: true,
        actions: const [
          MenuButton(),
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
                    if (Get.find<DoctorDetailController>()
                        .doctorDetail
                        .isNotEmpty) {
                      return Column(
                        children: <Widget>[
                          ///Doctor Profile
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DoctorProfileHorizontal(
                              imagePath: Get.find<DoctorDetailController>()
                                  .doctorDetail[0]
                                  .docPhoto,
                              drName: Get.find<DoctorDetailController>()
                                  .doctorDetail[0]
                                  .docName,
                              speciality: Get.find<DoctorDetailController>()
                                  .doctorDetail[0]
                                  .docSpeciality,
                              rating: Get.find<DoctorDetailController>()
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
                                  Get.find<DoctorDetailController>()
                                      .doctorDetail[0]
                                      .doctorAbout,
                                  textAlign: TextAlign.justify,
                                  overflow: Get.find<DoctorDetailController>()
                                          .isReadMore
                                          .value
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                                  maxLines: Get.find<DoctorDetailController>()
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
                                      Get.find<DoctorDetailController>()
                                              .isReadMore
                                              .value =
                                          !Get.find<DoctorDetailController>()
                                              .isReadMore
                                              .value;
                                    });
                                  },
                                  child: Text(
                                    (Get.find<DoctorDetailController>()
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
                              itemCount: Get.find<DoctorDetailController>()
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
                                    child: GetBuilder<DoctorDetailController>(
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
                                              Get.find<DoctorDetailController>()
                                                  .datesList[index]['day'],
                                          dayTextColor: (index ==
                                                  controller.dateIndex.value)
                                              ? AppColors.kwhite
                                              : AppColors.kdarkGrey,
                                          dateText:
                                              Get.find<DoctorDetailController>()
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
                            height: 180,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 170,
                                childAspectRatio: 2.8,
                                mainAxisSpacing: 4,
                              ),
                              itemCount: Get.find<DoctorDetailController>()
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
