import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/password_field.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/functions.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view_models/controller/auth_controllers/signup_doctor.dart';

class SignupDoctorScreen extends StatelessWidget {
  const SignupDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Signup as a Doctor',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.offNamedUntil(RoutesNames.login, (route) => false);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputField(
                    controller: Get.find<SignupDoctorController>().usernameController,
                    focusNode: Get.find<SignupDoctorController>().usernameFocusNode,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    labelText: 'Doctor Name',
                    hintText: 'Doctor Name',
                    prefixIcon: const Icon(Icons.person_3_outlined),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputField(
                    controller: Get.find<SignupDoctorController>().emailController,
                    focusNode: Get.find<SignupDoctorController>().emailFocusNode,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                    email != null && !AppFunctions.isEmail(email)
                        ? "Enter Valid Email"
                        : null,
                    prefixIcon: const Icon(
                      Icons.mail_outline_rounded,
                    ),
                    labelText: 'Enter your email',
                    hintText: 'Enter your email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputField(
                    controller: Get.find<SignupDoctorController>().phoneController,
                    focusNode: Get.find<SignupDoctorController>().mobileFocusNode,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (number) {
                      if (number != "" && number != null) {
                        AppFunctions.isPhone(number)
                            ? "Enter Valid Mobile Number"
                            : null;
                      } else {
                        return "Mobile number field cant be empty";
                      }
                      return null;
                    },
                    hintText: '03010000000',
                    labelText: 'Mobile no.',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Obx(
                        () => PasswordField(
                      controller: Get.find<SignupDoctorController>().passwordController,
                      focusNode: Get.find<SignupDoctorController>().passwordFocusNode,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? "Enter min. 6 characters"
                          : null,
                      labelText: 'Enter your password',
                      obscText: Get.find<SignupDoctorController>().showPassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Get.find<SignupDoctorController>().showPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          Get.find<SignupDoctorController>().showPassword.value =
                          !Get.find<SignupDoctorController>().showPassword.value;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Obx(
                              () => Checkbox(
                            focusNode:
                            Get.find<SignupDoctorController>().checkBoxFocusNode,
                            checkColor: Colors.white,
                            value: Get.find<SignupDoctorController>().isChecked.value,
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                            onChanged: (bool? value) {
                              Get.find<SignupDoctorController>().isChecked.value =
                              !Get.find<SignupDoctorController>().isChecked.value;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          text: TextSpan(
                            text: 'I agree to the medidoc ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Terms of Services ',
                                style:
                                const TextStyle(color: AppColors.kdarkColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/terms');
                                  },
                              ),
                              const TextSpan(
                                text: 'and ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style:
                                const TextStyle(color: AppColors.kdarkColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    );
                                  },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DarkButton(
                      text: 'Sign Up',
                      function: () {
                        Get.find<SignupDoctorController>().signupApi(context);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                              color: AppColors.kdarkColor,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RoutesNames.loginWidget);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RoutesNames.signup);
                    },
                    child: const Text(
                      'Signup as a Patient',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.kdarkColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
