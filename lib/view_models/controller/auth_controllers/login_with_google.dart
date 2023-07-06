
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medics/repository/auth_repository.dart';
import 'package:medics/res/routes/routes_names.dart';

class LoginWithGoogleController extends GetxController {

  final _api = AuthRepository();
  final List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  /// Login with Google
  void loginWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account != null) {
      Map data = {
        'user_name': account.displayName,
        'user_email': account.email,
        'user_photo_url': account.photoUrl,
      };
      _api.loginWithGoogle(data).then((value) {
        print(value);
        Get.offNamedUntil(RoutesNames.home, (route) => false);
      }).onError((error, stackTrace) {
        print(error);
      });
    }
  }
}
