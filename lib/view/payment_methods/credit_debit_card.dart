import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/payment_input_field.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/view_models/controller/payment_controller/payment_controller.dart';

import '../../res/app_urls/app_urls.dart';

class CreditDebitCard extends StatelessWidget {
  const CreditDebitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.klightTeal,
      appBar: AppBar(title: const Text('Credit/Debit Card', style: TextStyle(fontSize: 14),),),
      body: Column(
        children: [
          /// Add a new card Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: AppConstants.kpaddingLR),
              width: width,
              color: AppColors.kwhite,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text('Add a new card'),
                          Row(
                            children: [
                              SizedBox(
                                width: 35,
                                height: 25,
                                child: Image.network('${AppUrl.logos}visa_credit_card.png', fit: BoxFit.contain,),
                              ),
                              SizedBox(
                                width: 35,
                                height: 25,
                                child: Image.network('${AppUrl.logos}mastercard.png', fit: BoxFit.contain,),
                              ),
                              SizedBox(
                                width: 35,
                                height: 25,
                                child: Image.network('${AppUrl.logos}union.png', fit: BoxFit.contain,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.security_outlined, color: AppColors.kredColor,),
                              Text(
                                'SECURITY \n GUARANTEED',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 8, color: AppColors.kredColor),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /// Body part of this screen
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: AppConstants.kpaddingLR),
            color: AppColors.kwhite,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: PaymentInputField(
                    labelText: 'Card Number',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: PaymentInputField(
                    labelText: 'Cardholder Name',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: PaymentInputField(
                    labelText: 'MM/YY',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: PaymentInputField(
                    labelText: 'CVV',
                  ),
                ),
                ListTile(
                  title: const Text('Save Card', style: TextStyle(fontSize: 14),),
                  trailing: Obx(()=>Switch(
                      activeColor: AppColors.klightTeal,
                      activeTrackColor: AppColors.kdarkColor,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      value: Get.find<PaymentController>().saveCard.value,
                      onChanged: (value){
                        Get.find<PaymentController>().saveCard.value = value;
                      }
                  ),),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
                  child: Text('I acknowledge that my card information is saved in my Daraz account for subsequent transactions.',
                    style: TextStyle(fontSize: 12, color: AppColors.klightGrey),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: Image.network('${AppUrl.logos}visa_credit_card.png', fit: BoxFit.contain,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: Image.asset('${AppUrl.logos}paypal.png', fit: BoxFit.contain,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: Image.asset('${AppUrl.logos}mastercard.png', fit: BoxFit.contain,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: Image.asset('${AppUrl.logos}union.png', fit: BoxFit.contain,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// Bottom Pay Button
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR, vertical: 8),
              color: AppColors.kwhite,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('Subtotal', style: TextStyle(fontSize: 12,),),
                      Spacer(),
                      Text('Rs.288', style: TextStyle(fontSize: 12,),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Row(
                    children: [
                      Text('Subtotal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.kdarkColor ),),
                      Spacer(),
                      Text('Rs.288', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.kdarkColor),),
                    ],
                  ),
                  const Spacer(),
                  DarkButton(
                    text: 'Pay Now',
                    heightButton: 50,
                    widthButton: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
