import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/alert_box.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context,constraint){
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        width: width,
                        height: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.klightTeal,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.25,
                              child: Image.asset(
                                'images/pharmacy/l_lysine.jpg',
                                scale: 10,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'L-Lysine',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '75 ml',
                                  style: TextStyle(
                                    color: AppColors.klightGrey,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: AppColors.kwhiteSmoke,
                                      child: const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: AppColors.kdarkGrey,
                                          size: 12,
                                        ),),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: AppColors.kdarkColor,
                                      child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Colors.white,
                                            size: 12,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: AppColors.klightGrey,
                                  size: 16,
                                ),
                                const Spacer(),
                                Text(
                                  "${AppConstants.dollarSign}9.99 ",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        width: width,
                        height: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.klightTeal,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.25,
                              child: Image.asset(
                                'images/pharmacy/panadol.png',
                                scale: 10,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'Panadol',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '5pc (10 each coated)',
                                  style: TextStyle(
                                    color: AppColors.klightGrey,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: AppColors.kwhiteSmoke,
                                      child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: AppColors.kdarkGrey,
                                            size: 12,
                                          )),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: AppColors.kdarkColor,
                                      child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Colors.white,
                                            size: 12,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: AppColors.klightGrey,
                                  size: 16,
                                ),
                                const Spacer(),
                                Text(
                                  "${AppConstants.dollarSign}9.99 ",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Detail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sub Total',
                                  style: TextStyle(
                                    color: AppColors.klightGrey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${AppConstants.dollarSign}25.98',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Taxes',
                                  style: TextStyle(
                                    color: AppColors.klightGrey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${AppConstants.dollarSign}1.00',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${AppConstants.dollarSign}26.98',
                                  style: const TextStyle(
                                    color: AppColors.kdarkColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.klightTeal, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // FaIcon(
                                //   FontAwesomeIcons.ccVisa,
                                //   color: AppColors.kdarkColor,
                                // ),
                                Image.asset('assets/icons/VISA.png'),
                                const Text(
                                  'change',
                                  style: TextStyle(color: AppColors.klightGrey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10,),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Total', style: TextStyle(color: AppColors.klightGrey, fontSize: 16),),
                                const SizedBox(height: 5,),
                                Text(
                                  '${AppConstants.dollarSign}26.98',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DarkButton(
                                text: 'Checkout',
                                function: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertBox(
                                        title: 'Payment Success',
                                        desc:
                                        'Your payment has been successful, you can have a consultation session with your trusted doctor',
                                        buttonTitle: 'Back to Home',
                                        function: () {
                                          Get.toNamed(RoutesNames.pharmacyHome);
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
