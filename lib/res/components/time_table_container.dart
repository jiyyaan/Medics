import 'package:flutter/cupertino.dart';

import '../colors/app_colors.dart';

class TimeTableContainer extends StatelessWidget {
  const TimeTableContainer({
    super.key,
    required this.timeText,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
    this.fontWeight,
  });

  final Color? bgColor;
  final String timeText;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          timeText,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.only(bottom: 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.klightTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '09:00 AM',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: AppColors.klightTeal),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           margin: const EdgeInsets.symmetric(
//               horizontal: 5),
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.kdarkTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '10:00 AM',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.klightTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '11:00 AM',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: AppColors.klightTeal),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.only(bottom: 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.klightTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '01:00 PM',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: AppColors.klightTeal),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           margin: const EdgeInsets.symmetric(
//               horizontal: 5),
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             color: AppColors.kdarkColor,
//             border: Border.all(
//                 color: AppColors.kdarkTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '02:00 PM',
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.kdarkTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '03:00 PM',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.only(bottom: 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.kdarkTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '04:00 PM',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           margin: const EdgeInsets.symmetric(
//               horizontal: 5),
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.kdarkTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '07:00 PM',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 5),
//           height: 40,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: AppColors.klightTeal),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Center(
//             child: Text(
//               '08:00 PM',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: AppColors.klightTeal),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
