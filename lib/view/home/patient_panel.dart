import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/app_urls/app_urls.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/components/category.dart';
import 'package:medics/res/components/custom_progress_indicator.dart';
import 'package:medics/res/components/display_add.dart';
import 'package:medics/res/components/doctor_profile.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/menu_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/patient_panel_controllers/home_controller.dart';

class PatientPanel extends StatelessWidget {
  const PatientPanel({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      body: Obx(()=>(controller.categoryList.isNotEmpty &&
          controller.doctorsList.isNotEmpty && controller.patientDetail.isNotEmpty)
          ? const HomeScreen()
          : CustomProgressIndicator(width: width),),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 45,
              left: AppConstants.kpaddingLR,
              right: AppConstants.kpaddingLR),
          child: AppBar(
            primary: false,
            titleSpacing: 0,
            title: const Text(
              'Find your desire \n health solution',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: const [
              Icon(
                Icons.notifications_none_rounded,
                size: 35,
              ),
              MenuButton(),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (controller.categoryList.isNotEmpty &&
            controller.doctorsList.isNotEmpty) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.kpaddingLR),
              child: Column(
                children: [
                  ///Searchbar
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: InputField(
                      heightField: 40,
                      prefixIcon: Icon(
                        Icons.search_sharp,
                      ),
                      hintText: 'Search doctor, drugs, articles...',
                    ),
                  ),
                  ///Categories
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: (){
                              if(controller.categoryList[index].catName=="Pharmacy"){
                                Get.toNamed(RoutesNames.pharmacyHome);
                              }
                            },
                            child: Category(
                              catIcon: controller.categoryList[index].catIcon
                                  .toString(),
                              catName: controller.categoryList[index].catName
                                  .toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ///Advertisement
                  DisplayAdd(width: width, height: height),
                  ///Top Doctors Heading
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        const Text(
                          'Top Doctor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesNames.topDoctors);
                          },
                          child: const Text(
                            'see all',
                            style: TextStyle(
                              color: AppColors.kdarkColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /// Top Doctors
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.doctorsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesNames.doctorDetail,
                                  arguments: controller
                                      .doctorsList[index].docProfileId);
                            },
                            child: DoctorProfileVertical(
                              imagePath: NetworkImage(AppUrl.doctorPictures + controller.doctorsList[index].docPhoto),
                              nameDr: controller.doctorsList[index].docName
                                  .toString(),
                              speciality:
                                  controller.doctorsList[index].docSpeciality,
                              rating: controller.doctorsList[index].docRatings,
                              distance: '1.5km away',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ///Health Articles
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        const Text(
                          'Health Article',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesNames.articles);
                          },
                          child: const Text(
                            'see all',
                            style: TextStyle(
                              color: AppColors.kdarkColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///Articles
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.kwhiteSmoke, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage('${AppUrl.articlePictures}medicines.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'June 10, 2021 . 5min read',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: AppColors.kdarkGrey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.bookmark_outline_sharp,
                            color: AppColors.kdarkColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return CustomProgressIndicator(width: width);
        }
      }),
      bottomNavigationBar: BottomNavigation(width: width),
    );
  }
}
