import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';

import '../constants/constants.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({Key? key,
    required this.consultation,
    required this.adminFee,
    required this.addlDiscount,
    required this.totalAmount}) : super(key: key);
  final String consultation;
  final String adminFee;
  final String addlDiscount;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Payment Detail',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Consultation',
                style: TextStyle(
                  color: AppColors.klightGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                AppConstants.dollarSign + consultation.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Admin Fee',
                style: TextStyle(
                  color: AppColors.klightGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                AppConstants.dollarSign+adminFee.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Additional Discount',
                style: TextStyle(
                  color: AppColors.klightGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                AppConstants.dollarSign + addlDiscount.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppConstants.dollarSign+totalAmount.toString(),
                style: const TextStyle(
                  color: AppColors.kdarkColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}