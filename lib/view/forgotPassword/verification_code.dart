// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medics/res/colors/app_colors.dart';
// import 'package:medics/res/components/dark_button.dart';
// import 'package:medics/res/routes/routes_names.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:telephony/telephony.dart';
//
// class VerificationCode extends StatefulWidget {
//   const VerificationCode({super.key});
//
//   @override
//   _VerificationCodeState createState() => _VerificationCodeState();
// }
//
// class _VerificationCodeState extends State<VerificationCode> {
//   Telephony telephony = Telephony.instance;
//   OtpFieldController otpbox = OtpFieldController();
//
//   @override
//   void initState() {
//     telephony.listenIncomingSms(
//       onNewMessage: (SmsMessage message) {
//         print(message.address); //+977981******67, sender nubmer
//         print(message.body); //Your OTP code is 34567
//         print(message.date); //1659690242000, timestamp
//
//         String sms = message.body.toString(); //get the message
//
//         if (message.address == "+977981******67") {
//           //verify SMS is sent for OTP with sender number
//           String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'), '');
//           //prase code from the OTP sms
//           otpbox.set(otpcode.split(""));
//           //split otp code to list of number
//           //and populate to otb boxes
//
//           setState(() {
//             //refresh UI
//           });
//         } else {
//           print("Normal message.");
//         }
//       },
//       listenInBackground: false,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Text(
//               'Enter Verification Code',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 0,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//               child: RichText(
//                 text: const TextSpan(
//                     text: 'Enter code that we have sent to your number ',
//                     style: TextStyle(fontSize: 17, color: Colors.grey),
//                     children: [
//                       TextSpan(
//                         text: '08528188***',
//                         style: TextStyle(fontSize: 17, color: Colors.black),
//                       ),
//                     ]),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 30, right: 30),
//             alignment: Alignment.topLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 OTPTextField(
//                   controller: otpbox,
//                   length: 3,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 50,
//                   style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   textFieldAlignment: MainAxisAlignment.spaceEvenly,
//                   fieldStyle: FieldStyle.box,
//                   onCompleted: (pin) {
//                     print("Entered OTP Code: $pin");
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//             child: DarkButton(text: 'Verify', function: (){
//               Get.toNamed(RoutesNames.createNewPassword);
//             },),
//           ),
//           Expanded(
//             flex: 0,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: RichText(
//                 text: const TextSpan(
//                     text: 'Didn\'t receive the code? ',
//                     style: TextStyle(fontSize: 17, color: Colors.grey),
//                     children: [
//                       TextSpan(
//                         text: 'Resend',
//                         style: TextStyle(fontSize: 17, color: AppColors.kdarkColor),
//                       ),
//                     ]),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
