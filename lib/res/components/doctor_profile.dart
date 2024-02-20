import 'package:flutter/material.dart';
import 'package:medics/res/assets/image_assets.dart';
import 'package:medics/res/colors/app_colors.dart';

class DoctorProfileVertical extends StatelessWidget {
  const DoctorProfileVertical({
    super.key,
    required this.imagePath,
    required this.nameDr,
    required this.speciality,
    required this.rating,
    required this.distance,
  });

  final ImageProvider<Object>? imagePath;
  final String nameDr;
  final String speciality;
  final String rating;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.klightTeal, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.kwhiteSmoke,
                    backgroundImage: imagePath,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  nameDr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(speciality,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.kdarkGrey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 20,
                    decoration:BoxDecoration(
                      color: AppColors.klightTeal,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Icon(Icons.star, size: 14,color: AppColors.kdarkColor,),
                        Text(rating, style: const TextStyle(fontSize: 10, color: AppColors.kdarkColor, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.pin_drop_sharp, size: 12,color: AppColors.kdarkGrey,),
                        Text(distance, style: const TextStyle(color: AppColors.kdarkGrey, fontSize: 8),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}