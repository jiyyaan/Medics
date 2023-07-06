import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';

class DrugDetail extends StatefulWidget {
  const DrugDetail({Key? key}) : super(key: key);

  @override
  State<DrugDetail> createState() => _DrugDetailState();
}

class _DrugDetailState extends State<DrugDetail> {
  bool isReadMore = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drug Detail'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutesNames.myCart);
              },
              child: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 200,
                  ),
                  child: Image.asset(
                    'images/pharmacy/l_lysine.jpg',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20,),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'L-Lysine',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          '500 Capsule',
                          style: TextStyle(
                            color: AppColors.klightGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.kdarkColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.kdarkColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.kdarkColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.kdarkColor,
                              size: 16,
                            ),
                            Text(
                              '4.0',
                              style: TextStyle(color: AppColors.kdarkColor, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.kwhiteSmoke,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.minus,
                        color: AppColors.klightGrey,
                      ),
                    ),
                  ),
                  const Text(
                    '1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.kdarkColor,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${AppConstants.dollarSign}9.99',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                width: width,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.klightTeal,
                    width: 1.5,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing',
                        textAlign: TextAlign.justify,
                        overflow: isReadMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        maxLines: isReadMore ? null : 3,
                        style: const TextStyle(
                          color: AppColors.kdarkGrey,
                          height: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isReadMore = !isReadMore;
                          });
                        },
                        child: Text(
                          (isReadMore ? "Read less" : "Read more"),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 20,),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.klightTeal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesNames.myCart);
                      },
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: AppColors.kdarkColor,
                        size: 25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DarkButton(
                      text: 'Buy Now',
                      heightButton: 50,
                      function: () {
                        Get.toNamed(RoutesNames.myCart);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
