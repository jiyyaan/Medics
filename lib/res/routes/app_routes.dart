import 'package:get/get.dart';
import 'package:medics/res/routes/routes_names.dart';
import 'package:medics/view/articles/articles_screen.dart';
import 'package:medics/view/doctor_panel/doctor_form_one.dart';
import 'package:medics/view/doctor_panel/doctor_form_two.dart';
import 'package:medics/view/doctor_panel/doctor_panel.dart';
import 'package:medics/view/doctor_panel/doctor_profile.dart';
import 'package:medics/view/forgotPassword/forgot_password.dart';
import 'package:medics/view/forgotPassword/new_password.dart';
import 'package:medics/view/home/book_appointment.dart';
import 'package:medics/view/home/chat_doctor.dart';
import 'package:medics/view/home/doctor_detail.dart';
import 'package:medics/view/home/home_screen.dart';
import 'package:medics/view/home/messages_doctors.dart';
import 'package:medics/view/home/schedule_doctors.dart';
import 'package:medics/view/home/top_doctors.dart';
import 'package:medics/view/login/login_screen.dart';
import 'package:medics/view/login/signup_screen.dart';
import 'package:medics/view/onboarding/onboarding_screen.dart';
import 'package:medics/view/payment_methods/credit_debit_card.dart';
import 'package:medics/view/pharmacy/my_cart.dart';
import 'package:medics/view/pharmacy/pharmacy_home.dart';
import 'package:medics/view/profile/my_profile.dart';
import 'package:medics/view/settings/setting_screen.dart';
import 'package:medics/view/splash/splash_screen.dart';
import 'package:medics/view/welcome/welcome_screen.dart';
import 'package:medics/view_models/controller/auth_controllers/login.dart';
import 'package:medics/view_models/controller/auth_controllers/login_with_google.dart';
import 'package:medics/view_models/controller/auth_controllers/signup.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_one_controller.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_form_two_controller.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_panel_controller.dart';
import 'package:medics/view_models/controller/doctor_panel_controllers/doctor_profile_controller.dart';
import 'package:medics/view_models/controller/home_controller/booking_controller.dart';
import 'package:medics/view_models/controller/home_controller/doctor_detail_controller.dart';
import 'package:medics/view_models/controller/home_controller/home_controller.dart';
import 'package:medics/view_models/controller/payment_controller/jazzcash_controller.dart';
import 'package:medics/view_models/controller/payment_controller/payment_controller.dart';
import 'package:medics/view_models/controller/splash_screen_controllers/splash_controller.dart';
import 'package:medics/view_models/controller/welcome_screen_controller.dart';

class AppRoutes {
  static appRoutes() =>
      [
        GetPage(
          name: RoutesNames.splash,
          page: () => const SplashScreen(),
          binding: BindingsBuilder((){
            Get.lazyPut<SplashController>(() => SplashController());
          }),
        ),
        GetPage(
          name: RoutesNames.onBoarding,
          page: () => const OnBoarding(),
        ),
        GetPage(
          name: RoutesNames.welcome,
          page: () => const WelcomeScreen(),
          binding: BindingsBuilder((){
            Get.lazyPut<WelcomeScreenController>(() => WelcomeScreenController());
          }),
        ),
        GetPage(
          name: RoutesNames.loginWidget,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RoutesNames.login,
          page: () => const LoginScreen(),
          binding: BindingsBuilder((){
            Get.lazyPut<LoginController>(() => LoginController());
            Get.lazyPut<LoginWithGoogleController>(() => LoginWithGoogleController());
          }),
        ),
        GetPage(
          name: RoutesNames.forgot,
          page: () => const ForgotPassword(),
        ),
        GetPage(
          name: RoutesNames.createNewPassword,
          page: () => const CreateNewPassword(),
        ),
        GetPage(
          name: RoutesNames.signup,
          page: () => const SignUpScreen(),
          binding: BindingsBuilder((){
            Get.lazyPut<SignupController>(() => SignupController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorFormOne,
          page: () => const DoctorFormOne(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorFormOneController>(() => DoctorFormOneController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorFormTwo,
          page: () => const DoctorFormTwo(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorFormTwoController>(() => DoctorFormTwoController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorPanel,
          page: () => const DoctorPanel(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorPanelController>(() => DoctorPanelController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorPanel,
          page: () => const DoctorPanel(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorPanelController>(() => DoctorPanelController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorProfile,
          page: () => const DoctorProfile(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorProfileController>(() => DoctorProfileController());
          }),
        ),
        GetPage(
          name: RoutesNames.home,
          page: () => const HomeScreen(),
            binding: BindingsBuilder((){
              Get.lazyPut<HomeController>(() => HomeController());
            }),
        ),
        GetPage(
          name: RoutesNames.myProfile,
          page: () => const MyProfile(),
        ),
        GetPage(
          name: RoutesNames.booking,
          page: () => const BookAppointment(),
          binding: BindingsBuilder((){
            Get.lazyPut<BookingController>(() => BookingController());
            Get.lazyPut<PaymentController>(() => PaymentController());
            Get.lazyPut<JazzCashController>(() => JazzCashController());
          }),
        ),
        GetPage(
          name: RoutesNames.doctorDetail,
          page: () => const DoctorDetail(),
          binding: BindingsBuilder((){
            Get.lazyPut<DoctorDetailController>(() => DoctorDetailController());
          }),
        ),
        GetPage(
          name: RoutesNames.topDoctors,
          page: () => const TopDoctors(),
        ),
        GetPage(
          name: RoutesNames.messagesDoctor,
          page: () => const MessagesDoctors(),
        ),
        GetPage(
          name: RoutesNames.chatDoctor,
          page: () => const ChatDoctor(),
        ),
        GetPage(
          name: RoutesNames.scheduleDoctor,
          page: () => const ScheduleDoctors(),
        ),
        GetPage(
          name: RoutesNames.articles,
          page: () => const Articles(),
        ),
        GetPage(
          name: RoutesNames.settings,
          page: () => const SettingsScreen(),
        ),
        GetPage(
          name: RoutesNames.pharmacyHome,
          page: () => const PharmacyHome(),
        ),
        GetPage(
          name: RoutesNames.myCart,
          page: () => const MyCart(),
        ),
        GetPage(
          name: RoutesNames.creditDebitCard,
          page: () => const CreditDebitCard(),
          binding: BindingsBuilder((){
            Get.lazyPut<PaymentController>(() => PaymentController());
          }),
        ),
      ];
}
