import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:medics/res/localization/app_localization.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/routes/app_routes.dart';
import 'package:medics/view/splash/splash_screen.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = AppConstants.stripePublishKey;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Medics',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 100),
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.kdarkColor),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.kdarkColor,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      translations: Languages(),
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
