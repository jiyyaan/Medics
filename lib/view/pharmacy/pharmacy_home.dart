import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';

class PharmacyHome extends StatefulWidget {
  const PharmacyHome({Key? key}) : super(key: key);

  @override
  State<PharmacyHome> createState() => _PharmacyHomeState();
}

class _PharmacyHomeState extends State<PharmacyHome> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(RoutesNames.myCart);
              },
                child: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InputField(
                  heightField: 40,
                  prefixIcon: const Icon(
                    Icons.search_sharp,
                  ),
                  hintText: 'Search drugs, category...',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 5,
                  bottom: 5,
                ),
                width: width,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.klightTeal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order quickly with Prescription',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColors.kdarkColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Upload Prescription',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'images/tablets.png',
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      'Popular Product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 12, color: AppColors.kdarkColor),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/aromasin.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Aromasin', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15 tablets', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("${AppConstants.dollarSign}15.99", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/aldactone.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Aldactone', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15 tablets', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("${AppConstants.dollarSign}15.99", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/netidin.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Netidin', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15ml', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("${AppConstants.dollarSign}15.99", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      'Products on sale',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 12, color: AppColors.kdarkColor),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/panadol.png',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Panadol', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15 tablets', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "${AppConstants.dollarSign}9.99 ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                    children: [
                                      TextSpan(
                                        text: "${AppConstants.dollarSign}10.00", style: const TextStyle(color: AppColors.klightGrey, fontSize: 10, decoration: TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/edonax.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Edonax', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15 tablets', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "${AppConstants.dollarSign}9.99 ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                    children: [
                                      TextSpan(
                                        text: "${AppConstants.dollarSign}10.00", style: const TextStyle(color: AppColors.klightGrey, fontSize: 10, decoration: TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesNames.drugDetail);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(right: 10),
                        width: 120,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.klightTeal, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'images/pharmacy/zyrtec.png',
                                  ),
                                ),
                              ),
                            ),
                            const Text('Zyrtec', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),),
                            const Text('15 tablets', style: TextStyle(fontSize: 10, color: AppColors.klightGrey),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "${AppConstants.dollarSign}9.99 ", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                    children: [
                                      TextSpan(
                                        text: "${AppConstants.dollarSign}10.00", style: const TextStyle(color: AppColors.klightGrey, fontSize: 10, decoration: TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.add_box, color: AppColors.kdarkColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
