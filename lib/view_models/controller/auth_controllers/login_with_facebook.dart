
import 'package:get/get.dart';
import 'package:medics/repository/auth_repository.dart';

class LoginWithFacebookController extends GetxController{

  final _api = AuthRepository();

  /// Login with Facebook
  // void loginWithFacebook() async {
  //   // Log in with Facebook
  //   final LoginResult result = await FacebookAuth.instance.login();
  //
  //   if (result.status == LoginStatus.success) {
  //     // Get user access token
  //     final AccessToken accessToken = result.accessToken!;
  //
  //     // Get user data using the access token
  //     final userData = await FacebookAuth.instance.getUserData();
  //
  //     // Extract relevant fields from user data
  //     String? displayName = userData['name'];
  //     String? email = userData['email'];
  //     String? photoUrl = userData['picture']['data']['url'];
  //
  //     // Print user data
  //     print('Display Name: $displayName');
  //     print('Email: $email');
  //     print('Photo URL: $photoUrl');
  //   } else if (result.status == LoginStatus.cancelled) {
  //     // User cancelled the login process
  //     print('Login cancelled.');
  //   } else {
  //     // Login failed
  //     print('Login failed.');
  //   }
  // }

}