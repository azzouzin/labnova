import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../viewmodels/manager/splash_cubit.dart';
import 'splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..navigateToHome(context),
      child: const SplashViewBody(),
    );
  }
}
