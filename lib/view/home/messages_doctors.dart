import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/bottom_navigation.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';

import '../../res/app_urls/app_urls.dart';

class MessagesDoctors extends StatefulWidget {
  const MessagesDoctors({super.key});

  @override
  State<MessagesDoctors> createState() => _MessagesDoctorsState();
}

const double allAlign = -1;
const double groupAlign = 0;
const double privateAlign = 1;
const String allText = "All";
const String groupText = "Group";
const String privateText = "Private";
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black;

class _MessagesDoctorsState extends State<MessagesDoctors> {
  double? xAlign;
  Color? allColor;
  Color? groupColor;
  Color? privateColor;
  String? hintText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    xAlign = allAlign;
    allColor = selectedColor;
    groupColor = normalColor;
    privateColor = normalColor;
    hintText = allText;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Messages'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: Column(
          children: [
            /// Change Screen Buttons
            Container(
              width: width,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.klightTeal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: Alignment(xAlign!, 0),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: width / 3.5,
                      decoration: const BoxDecoration(
                        color: AppColors.kdarkColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = allAlign;
                        allColor = selectedColor;
                        groupColor = normalColor;
                        privateColor = normalColor;
                        hintText = allText;
                      });
                    },
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: Container(
                        width: width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.transparent,
                        ),
                        child: Center(
                            child: Text(
                          'All',
                          style: TextStyle(
                            color: allColor,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = groupAlign;
                        allColor = normalColor;
                        groupColor = selectedColor;
                        privateColor = normalColor;
                        hintText = groupText;
                      });
                    },
                    child: Align(
                      alignment: const Alignment(0, 0),
                      child: Container(
                        width: width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Group',
                            style: TextStyle(
                              color: groupColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = privateAlign;
                        allColor = normalColor;
                        groupColor = normalColor;
                        privateColor = selectedColor;
                        hintText = privateText;
                      });
                    },
                    child: Align(
                      alignment: const Alignment(1, 0),
                      child: Container(
                        width: width / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Private',
                            style: TextStyle(
                              color: privateColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// Chat Cards
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.toNamed(RoutesNames.chatDoctor);
                        } ,
                        child: Card(
                          elevation: 0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Marcus.png'),
                            ),
                            title: const Text(
                              'One-line ListTile',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                              'I don\'t have any fever, but headache',
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('10:40'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: AppColors.kdarkColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Maria.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:42'),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                '${AppUrl.icons}double-tick.png',
                                scale: 30,
                                color: AppColors.klightGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Marcus.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:40'),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.kdarkColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Maria.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:42'),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                '${AppUrl.icons}double-tick.png',
                                scale: 30,
                                color: AppColors.klightGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Marcus.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:40'),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.kdarkColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Maria.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:42'),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                '${AppUrl.icons}double-tick.png',
                                scale: 30,
                                color: AppColors.klightGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Marcus.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:40'),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.kdarkColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Maria.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:42'),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.network(
                                '${AppUrl.icons}double-tick.png',
                                scale: 30,
                                color: AppColors.klightGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('${AppUrl.doctorPictures}Dr.Marcus.png'),
                          ),
                          title: const Text(
                            'One-line ListTile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'I don\'t have any fever, but headache',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('10:40'),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.kdarkColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const ChatIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(width: width),
    );
  }
}

