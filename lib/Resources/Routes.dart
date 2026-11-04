
import 'package:cleaning_app/Authentication/CreatePassword/CreatePassword.dart';
import 'package:cleaning_app/Authentication/ForgotPassword/ForgotPassword.dart';
import 'package:cleaning_app/Authentication/Login/LoginScreen.dart';
import 'package:cleaning_app/Authentication/Signup/SignupDetailScreen.dart';
import 'package:cleaning_app/Authentication/Signup/SignupScreen.dart';
import 'package:cleaning_app/Authentication/Signup/SignupVerifyScreen.dart';
import 'package:cleaning_app/Authentication/VerifyNumber/VerifyNumber.dart';
import 'package:cleaning_app/Onboarding/OnboardingScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


class Routes {
  // Route names constants
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String createPassword = '/createPassword';
  static const String verifyNumber = '/verify-number';
  static const String signup = '/signup';
  static const String signupVerify = '/signupVerify';
  static const String signupDetailScreen = '/signupDetailScreen';

  // GoRouter Configuration
  static final GoRouter router = GoRouter(
    initialLocation: onboarding,
    routes: [
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (BuildContext context, GoRouterState state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        name: 'forgotPassword',
        builder: (BuildContext context, GoRouterState state) => const ForgotPassword(),
      ),
      GoRoute(
        path: verifyNumber,
        builder: (context, state) => const VerifyNumber(),
      ),
      GoRoute(
        path: createPassword,
        builder: (context, state) => const CreatePassword(),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: signupVerify,
        builder: (context, state) => const SignupVerifyScreen(),
      ),
      GoRoute(
        path: signupDetailScreen,
        builder: (context, state) => const SignupDetailScreen(),
      ),
    ],
  );
}