import 'package:flutter/material.dart';
import 'package:smart_pay_app/presentation/dashboard/dashboard_screen.dart';

import '../../presentation/confirmation_screen/confirmation_screen.dart';
import '../../presentation/create_pin_screen/create_pin_screen.dart';
import '../../presentation/onboarding_one_screen/onboarding_one_screen.dart';
import '../../presentation/onboarding_two_screen/onboarding_two_screen.dart';
import '../../presentation/otp_authentication_screen/otp_authentication_screen.dart';
import '../../presentation/sign_in_screen/sign_in_screen.dart';
import '../../presentation/sign_up_screen/sign_up_screen.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import '../../presentation/verify_id_screen/verify_id_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String signUpEmpityScreen = '/sign_up_empity_screen';

  static const String signUpScreen = '/sign_up_filled_screen';

  static const String otpAuthenticationScreen = '/otp_authentication_screen';

  static const String idEmptyScreen = '/id_empty_screen';

  static const String idFillScreen = '/id_fill_screen';

  static const String createPinScreen = '/create_pin_screen';

  static const String confirmationScreen = '/confirmation_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _buildPageRouteBuilder(
            SplashScreen.builder, _fadeTransitionBuilder);
      case onboardingOneScreen:
        return _buildPageRouteBuilder(
            OnboardingOneScreen.builder, _fadeTransitionBuilder);
      case onboardingTwoScreen:
        return _buildPageRouteBuilder(
            OnboardingTwoScreen.builder, _fadeTransitionBuilder);
      case signInScreen:
        return _buildPageRouteBuilder(
            SignInFilledScreen.builder, _slideTransitionBuilder);
      case dashboardScreen:
        return _buildPageRouteBuilder(
            DashboardScreen.builder, _slideTransitionBuilder);
      case signUpScreen:
        return _buildPageRouteBuilder(
            SignUpScreen.builder, _slideTransitionBuilder);
      case otpAuthenticationScreen:
        return _buildPageRouteBuilder(
            OtpAuthenticationScreen.builder, _slideTransitionBuilder);
      case idFillScreen:
        return _buildPageRouteBuilder(
            IdFillScreen.builder, _fadeTransitionBuilder);
      case createPinScreen:
        return _buildPageRouteBuilder(
            CreatePinScreen.builder, _fadeTransitionBuilder);
      case confirmationScreen:
        return _buildPageRouteBuilder(
            ConfirmationScreen.builder, _fadeTransitionBuilder);
      case initialRoute:
        return _buildPageRouteBuilder(
            SplashScreen.builder, _fadeTransitionBuilder);
      default:
        return null;
    }
  }

  static PageRouteBuilder<dynamic> _buildPageRouteBuilder(
      WidgetBuilder builder,
      Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionBuilder) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: transitionBuilder,
    );
  }

  static Widget _fadeTransitionBuilder(
      context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return FadeTransition(
      opacity: curvedAnimation,
      child: child,
    );
  }

  static Widget _slideTransitionBuilder(
      context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.bounceInOut;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
