import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/constants/assets_const.dart';
import 'package:labnova/core/utils/styles.dart';
import 'package:labnova/features/auth/presentation/view/widgets/sign_in_form.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/sigu_up_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSignUp) return SingUpForm();
                      if (state is AuthSignIN) return SignInForm();
                      if (state is AuthLoading) return CustomLoadingWidget();
                      return SingUpForm();
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
