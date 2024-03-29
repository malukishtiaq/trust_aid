import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';

class AppRoutes {
  static const String base = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgotpassword';
  static const String changePassword = 'changepassword';
  static const String otpVerification = 'otpverification';

  static const String home = 'home';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.base,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
      routes: [
        GoRoute(
          path: AppRoutes.register,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
      ],
    ),
  ],
);
