import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/menu_button.dart';
import 'package:medics/res/components/received_msg.dart';
import 'package:medics/res/components/sent_message.dart';
import 'package:medics/res/constants/constants.dart';

class ChatDoctor extends StatelessWidget {
  const ChatDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kdarkColor,
        foregroundColor: AppColors.kwhite,
        title: const Text('Dr. Marcus Horizon', style: TextStyle(color: AppColors.kwhite),),
        actions: const [
          Align(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.video,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.call),
          ),
          MenuButton(color: AppColors.kwhite, textColor: AppColors.kblack,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: width,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.klightTeal,
                              width: 1.5,
                            )),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Consultation Start',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.kdarkColor,
                                ),
                              ),
                            ),
                            Text(
                              'You can consult your problem to the doctor',
                              style: TextStyle(
                                color: AppColors.klightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SentMessage(
                          width: width,
                          imagePath: 'images/Dr.Marcus.png',
                          nameDr: 'Dr.Marcus Horizon',
                          timeWas: '10 min ago',
                          msgDesc: 'Hello, How can i help you?',
                          onTime: '09:00 AM',
                        ),
                        ReceivedMessage(
                          width: width,
                          msgDesc:
                              'I have suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain',
                          onTime: '09:10 AM',
                        ),
                        SentMessage(
                          width: width,
                          imagePath: 'images/Dr.Marcus.png',
                          nameDr: 'Dr.Marcus Horizon',
                          timeWas: '5 min ago',
                          msgDesc: 'Ok, Do you have fever? is the headchace severe',
                          onTime: '09:05 AM',
                        ),
                        ReceivedMessage(
                          width: width,
                          msgDesc:
                          'I don,t have any fever, but headchace is painful',
                          onTime: '09:12 AM',
                        ),
                        SentMessage(
                          width: width,
                          imagePath: 'images/Dr.Marcus.png',
                          nameDr: 'Dr.Marcus Horizon',
                          timeWas: '5 min ago',
                          msgDesc: 'Ok, Do you have fever? is the headchace severe',
                          onTime: '09:05 AM',
                        ),
                        ReceivedMessage(
                          width: width,
                          msgDesc:
                          'I don,t have any fever, but headchace is painful',
                          onTime: '09:12 AM',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            color: AppColors.klightTeal,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InputField(
                          prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                          hintText: 'Type message',
                          heightField: 45,
                          suffixIcon: const Icon(Icons.attach_file),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.kdarkColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.mic, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
