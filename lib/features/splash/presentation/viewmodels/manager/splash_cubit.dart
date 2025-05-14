import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void navigateToHome(BuildContext context) {
    emit(SplashLoading());

    Future.delayed(
      const Duration(seconds: 2),
      () {
        // GoRouter.of(context).pushReplacement('/home');
        emit(SplashNavigationComplete());
      },
    );
  }
}
