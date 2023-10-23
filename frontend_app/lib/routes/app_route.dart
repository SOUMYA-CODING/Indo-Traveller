import 'package:frontend_app/routes/route_names.dart';
import 'package:frontend_app/views/screens/authentication/login_screen.dart';
import 'package:frontend_app/views/screens/authentication/password_reset_screen.dart';
import 'package:frontend_app/views/screens/authentication/registration/otp_screen.dart';
import 'package:frontend_app/views/screens/authentication/registration/registration_confirm_screen.dart';
import 'package:frontend_app/views/screens/authentication/registration/registration_screen.dart';
import 'package:frontend_app/views/screens/dashboard/dashboard_tab.dart';
import 'package:frontend_app/views/screens/start/onboarding_screen.dart';
import 'package:frontend_app/views/screens/start/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static final List<GetPage> routes = [
    //   Start
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.onboardingScreen,
      page: () => const OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),

    // Authentication
    GetPage(
      name: RouteNames.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.registrationScreen,
      page: () => const RegistrationScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteNames.optScreen,
      page: () => const OtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.registrationConfirmScreen,
      page: () => const RegistrationConfirmScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.passwordResetScreen,
      page: () => const PasswordResetScreen(),
      transition: Transition.downToUp,
    ),

    // Dashboard
    GetPage(
      name: RouteNames.dashboardScreen,
      page: () => const DashboardScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
