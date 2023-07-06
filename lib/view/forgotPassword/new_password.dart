import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/password_field.dart';
import 'package:medics/res/routes/routes_names.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);
  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    bool password = true;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create New Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'create your new password to login',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PasswordField(
                  hintText: 'New Password',
                  obscText: password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      password ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          password = !password;
                        },
                      );
                    },
                  ),
                ),
              ),
              PasswordField(
                hintText: 'Confirm Password',
                obscText: password,
                suffixIcon: IconButton(
                  icon: Icon(
                    password ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      password = !password;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: DarkButton(
                  text: 'Create Password',
                  function: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          iconPadding: const EdgeInsets.symmetric(
                            vertical: 50,
                          ),
                          icon: Stack(alignment: Alignment.center, children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppColors.kwhiteSmoke,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 40,
                              ),
                            ),
                          ]),
                          iconColor: AppColors.kdarkColor,
                          title: const Text('Success'),
                          content: const Text(
                            'You have successfully reset your password.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
                              child: DarkButton(text: 'Login', function: (){
                                Get.toNamed(RoutesNames.login);
                              },),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
