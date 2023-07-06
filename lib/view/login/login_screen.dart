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

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DarkButton(text: 'Login', function: (){
                    Get.find<LoginController>().loginApi();
                  },),
                ),
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
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'OR',
                    style: TextStyle(color: AppColors.kdarkGrey, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Google',
                    path: 'assets/icons/google.png',
                    function: () {
                      Get.find<LoginWithGoogleController>().loginWithGoogle(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Facebook',
                    path: 'assets/icons/facebook.png',
                    function: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SignInWith(
                    text: 'Sign in with Apple',
                    path: 'assets/icons/apple.png',
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
