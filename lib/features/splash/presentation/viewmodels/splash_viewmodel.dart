import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel extends ChangeNotifier {
  void navigateToHome(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push('/home');
      },
    );
  }
}