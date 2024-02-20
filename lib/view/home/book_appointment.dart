import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/doctor_profile_horizontal.dart';
import 'package:medics/res/components/payment_detail.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view_models/controller/patient_panel_controllers/booking_controller.dart';
import 'package:medics/view_models/controller/payment_controller/jazzcash_controller.dart';
import 'package:medics/view_models/controller/payment_controller/payment_controller.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.find<BookingController>();
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kwhite,
        backgroundColor: AppColors.kdarkColor,
        title: const Text('Appointment'),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.kpaddingLR),
                child: Obx(() {
                  if (Get.find<BookingController>().doctorDetail.isNotEmpty) {
                    return Column(
                      children: [
                        ///Doctor Profile
                        DoctorProfileHorizontal(
                          imagePath: NetworkImage(AppUrl.doctorPictures + controller.doctorDetail[0].docPhoto),
                          drName: Get.find<BookingController>()
                              .doctorDetail[0]
                              .docName,
                          speciality: Get.find<BookingController>()
                              .doctorDetail[0]
                              .docSpeciality,
                          rating: Get.find<BookingController>()
                              .doctorDetail[0]
                              .docRatings,
                          distance: '800m away',
                          borderColor: Colors.transparent,
                        ),
                        /// Date Headings
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Date & Time of Appointment',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'change',
                                  style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /// Date and Time
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              /// Icon Formatting
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.klightTeal,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.calendarDays,
                                      color: AppColors.kdarkColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),

                              /// Date Text
                              Text(
                                controller.bookingModel.dateAppointment +
                                    " | " +
                                    controller.bookingModel.timeAppointment,
                                style: const TextStyle(
                                    color: AppColors.kdarkGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: AppColors.klightTeal,
                          thickness: 1.5,
                        ),
                        /// Your Symptoms Heading
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Your Symptoms',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Reason'),
                                        content: TextField(
                                          controller: controller.symptomsController,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              controller.symptoms.value =
                                                  controller
                                                      .symptomsController.text;
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'change',
                                  style: TextStyle(
                                      color: AppColors.klightGrey,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: controller.symptomsController,
                              focusNode: controller.symptomsFocusNode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.klightTeal,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.penToSquare,
                                      color: AppColors.kdarkColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                hintText: 'Tell me something about your discomfort...',
                                hintStyle: const TextStyle(
                                    color: AppColors.kdarkGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColors.klightTeal,
                          thickness: 1.5,
                        ),
                        ///Payment Detail
                        Obx(()=>PaymentDetail(
                          consultation:
                          controller.doctorDetail[0].consultationFee,
                          adminFee: AppConstants.adminFee.toString(),
                          addlDiscount: AppConstants.addlDiscount.toString(),
                          totalAmount: controller.totalAmount.value =  controller
                              .paymentTotal(
                              consultation: double.parse(controller
                                  .doctorDetail[0].consultationFee),
                              addlDiscount: AppConstants.addlDiscount,
                              adminFee: AppConstants.adminFee)
                              .toString(),
                        ),),
                        const Divider(
                          thickness: 1.5,
                          color: AppColors.klightTeal,
                        ),
                        /// Payment Method
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        /// Payment Method Drop Down List
                        Obx(()=>DropdownButtonFormField(
                          isDense: true,
                          isExpanded: true,
                          items: controller.dropDownItems.value,
                          value: controller.selectedPaymentMethod.value,
                          hint: const Text('Select Payment Method'),
                          onChanged: (newValue){
                            controller.selectedPaymentMethod.value = newValue.toString();
                          })),
                        const Spacer(),
                        /// Total Payment and Button
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                          color: AppColors.klightGrey),
                                    ),
                                    Obx(()=>Text(
                                      AppConstants.dollarSign +
                                          controller.totalAmount.value,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: DarkButton(
                                  text: 'Get Appointment',
                                  heightButton: 50,
                                  function: (){
                                    controller.getAppointment(context);
                                    if (kDebugMode) {
                                      print(controller.selectedPaymentMethod.value);
                                    }
                                    if(controller.selectedPaymentMethod.value == "1"){
                                      Get.find<PaymentController>().makePayment(
                                              amount: controller.totalAmount.value,
                                              currency: 'USD');
                                    }if(controller.selectedPaymentMethod.value == "2"){
                                      Utils.toastErrorMessage("This Payment Method not set yet");
                                    }else if (controller.selectedPaymentMethod.value == "3"){
                                      Get.find<JazzCashController>().payWithJazzCash(controller.totalAmount.value);
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
                      child: CustomProgressIndicator(
                        width: width,
                      ),
                    );
                  }
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}
