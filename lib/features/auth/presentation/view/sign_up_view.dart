import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/constants/assets_const.dart';
import 'package:labnova/core/utils/styles.dart';
import 'package:labnova/features/auth/presentation/view/widgets/sign_in_form.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../core/constants/theme_const.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/sigu_up_header.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final sigUpForm = SingUpForm();
  final sigINForm = SignInForm();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetsData.kauthBG,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => AuthCubit(),
              child: Column(
                children: [
                  SignUPHeader(size: size),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthAuthenticated) {
                        GoRouter.of(context).push(kHomeView);
                      }
                      if (state is AuthEnterPhone) {
                        GoRouter.of(context).push(kOtpView);
                      }
                      if (state is AuthError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthSignUp) return sigUpForm;
                      if (state is AuthSignIN) return sigINForm;
                      if (state is AuthLoading) return CustomLoadingWidget();
                      return sigUpForm;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
