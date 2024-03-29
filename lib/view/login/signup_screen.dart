import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/password_field.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/utils/functions.dart';
import 'package:medics/utils/utils.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view_models/controller/auth_controllers/signup.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.find<SignupController>();
    double width = MediaQuery.of(context).size.width;
    double toggleWidth = width - 60;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Signup',
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
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.kwhiteSmoke,
                      border: Border.all(color: AppColors.ktextFieldBorderColor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Obx(()=>Stack(
                        children: [
                          AnimatedAlign(
                            alignment: Alignment(controller.xAlign.value, 0),
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
                              controller.xAlign.value =
                                  controller.leftAlign;
                              controller.leftColor.value =
                                  controller.selectedColor;
                              controller.rightColor.value =
                                  controller.normalColor;
                              controller.userRole.value = "1";
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
                                    'Patient',
                                    style: TextStyle(
                                      color: controller.leftColor.value,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.xAlign.value = controller.rightAlign;
                              controller.rightColor.value = controller.selectedColor;
                              controller.leftColor.value = controller.normalColor;
                              controller.userRole.value = "2";
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
                                    'Doctor',
                                    style: TextStyle(
                                      color: controller.rightColor.value,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InputField(
                    controller: Get.find<SignupController>().usernameController,
                    focusNode: Get.find<SignupController>().usernameFocusNode,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    labelText: 'Enter Your name',
                    hintText: 'Enter Your name',
                    prefixIcon: const Icon(Icons.person_3_outlined),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InputField(
                    controller: Get.find<SignupController>().genderController,
                    focusNode: Get.find<SignupController>().genderFocusNode,
                    labelText: 'Gender',
                    prefixIcon: Obx(
                      () => Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child:
                                (controller.selectedGender.value == Gender.male)
                                    ? const FaIcon(FontAwesomeIcons.mars)
                                    : const FaIcon(FontAwesomeIcons.venus),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Male'),
                          ),
                          Radio(
                            activeColor: AppColors.kdarkColor,
                            value: Gender.male,
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value!;
                              controller.gender.value = "1";
                            },
                          ),
                          const Text('Female'),
                          Radio(
                            activeColor: AppColors.kdarkColor,
                            value: Gender.female,
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.selectedGender.value = value!;
                              controller.gender.value = "0";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InputField(
                    controller: Get.find<SignupController>().dobController,
                    focusNode: Get.find<SignupController>().dobFocusNode,
                    prefixIcon: const Icon(CupertinoIcons.calendar),
                    labelText: 'Date of Birth',
                    onTap: () {
                      Utils.closeKeyboard();
                      controller.selectDate(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: InputField(
                    controller: Get.find<SignupController>().emailController,
                    focusNode: Get.find<SignupController>().emailFocusNode,
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
                  padding: const EdgeInsets.only(top: 8),
                  child: InputField(
                    controller: Get.find<SignupController>().phoneController,
                    focusNode: Get.find<SignupController>().mobileFocusNode,
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
                    labelText: 'Mobile No.',
                    hintText: '03010000000',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Obx(
                    () => PasswordField(
                      controller:
                          Get.find<SignupController>().passwordController,
                      focusNode: Get.find<SignupController>().passwordFocusNode,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? "Enter min. 6 characters"
                          : null,
                      labelText: 'Enter your password',
                      hintText: 'Enter your password',
                      obscText: Get.find<SignupController>().showPassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Get.find<SignupController>().showPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          Get.find<SignupController>().showPassword.value =
                              !Get.find<SignupController>().showPassword.value;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Obx(
                          () => Checkbox(
                            focusNode:
                                Get.find<SignupController>().checkBoxFocusNode,
                            checkColor: Colors.white,
                            value: Get.find<SignupController>().isChecked.value,
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                            onChanged: (bool? value) {
                              Get.find<SignupController>().isChecked.value =
                                  !Get.find<SignupController>().isChecked.value;
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
                                style: const TextStyle(
                                    color: AppColors.kdarkColor),
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
                                style: const TextStyle(
                                    color: AppColors.kdarkColor),
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: DarkButton(
                    heightButton: 50,
                      text: 'Sign Up',
                      function: () {
                        Get.find<SignupController>().signupApi(context);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
