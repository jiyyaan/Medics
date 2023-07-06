import 'package:flutter/material.dart';
import 'package:medics/res/assets/image_assets.dart';
import 'package:medics/res/colors/app_colors.dart';

class DoctorProfileHorizontal extends StatelessWidget {
  const DoctorProfileHorizontal({
    super.key,
    required this.imagePath,
    required this.drName,
    required this.speciality,
    required this.rating,
    required this.distance,
    this.borderColor = const Color(0xFFE8F3F1),
  });
  final String imagePath;
  final String drName;
  final String speciality;
  final String rating;
  final String distance;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: width *0.25,
                    height: width *0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(MedicsImageAssets.baseDoctorProfileURL+imagePath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      drName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      speciality,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.kdarkGrey,
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 22,
                    decoration:BoxDecoration(
                      color: AppColors.klightTeal,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Icon(Icons.star, size: 16,color: AppColors.kdarkColor,),
                        Text(rating, style: const TextStyle(fontSize: 12, color: AppColors.kdarkColor, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        const Icon(Icons.pin_drop_sharp, size: 14, color: AppColors.kdarkGrey,),
                        Text(distance, style: const TextStyle(color: AppColors.kdarkGrey, fontSize: 12),),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}