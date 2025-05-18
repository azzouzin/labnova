import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/theme_const.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthSignUp());

  void switchState() {
    if (state is AuthSignUp) {
      emit(AuthSignIN());
    } else if (state is AuthSignIN) {
      emit(AuthSignUp());
    } else {
      emit(AuthSignUp());
    }
  }

  void switchOTP() {
    emit(AuthEnterOTP());
  }

  void signUp(BuildContext context) {
    emit(AuthEnterPhone());
    GoRouter.of(context).push(kOtpView);
  }

  void seccessOTP(BuildContext context) {
    emit(AuthSignIN());
    GoRouter.of(context).push(kAuthView);
  }
}
