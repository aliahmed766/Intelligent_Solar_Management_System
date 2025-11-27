import 'package:flutter/material.dart';
import 'package:solar_calculation_system/routeUtils/route_names.dart';
import 'package:solar_calculation_system/ui/about_screen.dart';
import 'package:solar_calculation_system/ui/calculate_system_screen.dart';
import 'package:solar_calculation_system/ui/choose_backup_screen.dart';
import 'package:solar_calculation_system/ui/contact_screen.dart';
import 'package:solar_calculation_system/ui/get_started_screen.dart';
import 'package:solar_calculation_system/ui/home_screen.dart';
import 'package:solar_calculation_system/ui/log_in_screen.dart';
import 'package:solar_calculation_system/ui/result_screen.dart';
import 'package:solar_calculation_system/ui/sign_up_screen.dart';
import 'package:solar_calculation_system/ui/splash_screen.dart';
import 'package:solar_calculation_system/ui/vendor_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.ROUTE_SPLASH_SCREEN:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.ROUTE_LOGIN_SCREEN:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteNames.ROUTE_SIGNUP_SCREEN:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case RouteNames.ROUTE_HOME_SCREEN:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteNames.ROUTE_ABOUT_US_SCREEN:
        return MaterialPageRoute(builder: (context) => AboutScreen());
      case RouteNames.ROUTE_CONTACT_US_SCREEN:
        return MaterialPageRoute(builder: (context) => ContactUsScreen());
      case RouteNames.ROUTE_GET_STARTED_SCREEN:
        return MaterialPageRoute(builder: (context) => GetStartedScreen());
      case RouteNames.ROUTE_RESULTS_SCREEN:
        Map data = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => ResultScreen(
          totalLoad: data["totalLoad"] ,
          currentLoad: data["currentLoad"],
          isAcSystem: data["isAcSystem"],
        ));
      case RouteNames.ROUTE_VENDORS_SCREEN:
        return MaterialPageRoute(builder: (context) => VendorScreen());
      case RouteNames.ROUTE_CHOOSE_BACKUP_SCREEN:
        return MaterialPageRoute(
            builder: (context) =>
                ChooseBackupScreen(isAcCurrent: settings.arguments as bool));
      case RouteNames.ROUTE_CALCULATE_SYSTEM_SCREEN:
        Map data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => CalculateSystemScreen(
                isAcSystem: data["isAcSystem"],
                isWithBackup: data["isWithBackup"]));
      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
        break;
    }
  }
}
