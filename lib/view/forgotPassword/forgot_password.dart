import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

const double emailAlign = -1;
const double phoneAlign = 1;
const Color selectedColor = Color(0xFF199A8E);
const Color normalColor = Colors.grey;
const String emailText = 'Email';
const String phoneText = 'Phone';
const Icon emailIcon = Icon(Icons.mail_outline_rounded);
const Icon phoneIcon = Icon(Icons.phone_android_outlined);
final formKey = GlobalKey<FormState>();


class _ForgotPasswordState extends State<ForgotPassword> {
  double? xAlign;
  Color? emailColor;
  Color? phoneColor;
  String? hintText;
  Icon? preIcon;
  Icon? suffixIcon;
  final emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    xAlign = emailAlign;
    emailColor = selectedColor;
    phoneColor = normalColor;
    hintText = emailText;
    preIcon = emailIcon;
    suffixIcon = const Icon(Icons.check);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double toggleWidth = width - 60;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Text(
                    'Enter your email or your phone number, we will send you confirmation code',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: toggleWidth,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.kwhiteSmoke,
                    border: Border.all(color: AppColors.klightGrey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(xAlign!, 0),
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: width * 0.4,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = emailAlign;
                              emailColor = selectedColor;
                              phoneColor = normalColor;
                              hintText = emailText;
                              preIcon = emailIcon;
                              suffixIcon = const Icon(Icons.check);
                            });
                          },
                          child: Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: toggleWidth * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                  child: Text(
                                'Email',
                                style: TextStyle(
                                  color: emailColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = phoneAlign;
                              phoneColor = selectedColor;
                              emailColor = normalColor;
                              hintText = phoneText;
                              preIcon = phoneIcon;
                              suffixIcon = null;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(1, 0),
                            child: Container(
                              width: toggleWidth * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                  child: Text(
                                'Phone',
                                style: TextStyle(
                                  color: phoneColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 20, top: 20),
                child: InputField(
                  controller: emailController,
                  prefixIcon: preIcon,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email)=>
                  // email!=null && !EmailValidator.validate(email) ? "Enter Valid Email" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 20,
                ),
                child: DarkButton(
                  function: (){},
                  //     (){
                  //   Get.toNamed(RoutesNames.verifyCodeScreen);
                  // },
                  text: 'Reset Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
