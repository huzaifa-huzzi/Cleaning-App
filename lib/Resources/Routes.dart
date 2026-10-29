
import 'package:cleaning_app/Onboarding/OnboardingScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


class Routes {
  // Route names constants
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';

  // GoRouter Configuration
  static final GoRouter router = GoRouter(
    initialLocation: onboarding,
    routes: [
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (BuildContext context, GoRouterState state) => const OnboardingScreen(),
      ),
    ],
  );
}