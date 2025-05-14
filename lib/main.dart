import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/theme_const.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const LabNovaApp());
}

class LabNovaApp extends StatelessWidget {
  const LabNovaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
    );
  }
}
