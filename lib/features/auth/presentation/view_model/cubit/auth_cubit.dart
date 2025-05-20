import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/features/auth/data/repo/auth_repository_impl.dart';

import '../../../../../core/constants/theme_const.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/utils/widgets/custom_error_widget.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthSignUp());

  AuthRepositoryImpl authRepository = AuthRepositoryImpl();
  User? userModel;

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

  void seccessOTP(BuildContext context) {
    emit(AuthSignIN());
    GoRouter.of(context).push(kAuthView);
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    emit(AuthLoading());
    try {
      final userCredential =
          await authRepository.signInWithEmail(email, password);
      final userModel =
          await authRepository.getUserProfile(userCredential.user!.uid);

      emit(AuthAuthenticated(userModel!));
    } catch (e) {
      print(e.toString());
      emit(
        AuthError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> signUp(
      String email, String password, String name, BuildContext context) async {
    emit(AuthLoading());
    try {
      await authRepository.signUpWithEmail(email, password, name);
      CustomMessengers.showseccessSnackBar("User Created", context);
      emit(AuthEnterPhone());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await authRepository.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      final isSignedIn = await authRepository.isSignedIn();

      if (isSignedIn) {
        userModel = await authRepository.getUserProfile(
          (await authRepository.getCurrentUserId())!,
        );
        emit(
          AuthAuthenticated(userModel!),
        );
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(
        AuthError(
          e.toString(),
        ),
      );
    }
  }

  Future<String?> getUserName() async {
    return (await authRepository.getUserProfile(
      (await authRepository.getCurrentUserId())!,
    ))!
        .name;
  }
}
