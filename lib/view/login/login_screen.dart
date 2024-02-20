import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/components/dark_button.dart';
import 'package:medics/res/components/input_field.dart';
import 'package:medics/res/components/password_field.dart';
import 'package:medics/res/components/sign_in_with.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view_models/controller/auth_controllers/login.dart';
import 'package:medics/view_models/controller/auth_controllers/login_with_google.dart';

import '../../res/app_urls/app_urls.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.offNamedUntil(RoutesNames.welcome, (route) => false);
          },
          child: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Column(
              children: [
                ///Enter Your Name
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InputField(
                    focusNode: Get.find<LoginController>().usernameFocusNode,
                    controller: Get.find<LoginController>().usernameController,
                    textInputAction: TextInputAction.next,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    labelText: 'Email or phone',
                    prefixIcon: const Icon(
                      Icons.person_3_outlined,
                    ),
                  ),
                ),
                ///Enter your password
                Padding(
                  padding: const EdgeInsets.only(top : 20),
                  child: Obx(()=>PasswordField(
                    controller: Get.find<LoginController>().passwordController,
                    focusNode: Get.find<LoginController>().passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    labelText: 'Enter your Password',
                    obscText: Get.find<LoginController>().showPassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Get.find<LoginController>().showPassword.value ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        Get.find<LoginController>().showPassword.value =! Get.find<LoginController>().showPassword.value;
                      },
                    ),
                  ),),
                ),
                /// Forgot password
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesNames.forgot);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.kdarkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                /// Login Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DarkButton(
                    text: 'Login',
                    function: (){
                      Get.find<LoginController>().loginApi();
                  },),
                ),
                ///Signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style:
                          TextStyle(color: AppColors.kdarkGrey, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesNames.signup);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kdarkColor,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                ///OR
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'OR',
                    style: TextStyle(color: AppColors.kdarkGrey, fontSize: 16),
                  ),
                ),
                /// Signup with google
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Google',
                    path: "${AppUrl.logos}google.png",
                    function: () {
                      Get.find<LoginWithGoogleController>().loginWithGoogle(context);
                    },
                  ),
                ),
                ///Signup with facebook
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Facebook',
                    path: '${AppUrl.logos}facebook.png',
                    function: () {},
                  ),
                ),
                /// Signup with apple
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Apple',
                    path: '${AppUrl.logos}apple.png',
                    function: () {},
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
