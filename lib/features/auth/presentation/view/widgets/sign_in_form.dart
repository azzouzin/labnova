import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';

import '../../../../../core/constants/theme_const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../view_model/cubit/auth_cubit.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).push(kHomeView);
          CustomMessengers.showseccessSnackBar("Soyez Bienvenu ", context);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Mot de passe',
                labelText: 'Mot de passe',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              GestureDetector(
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextThemes.TextStyle14.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onTap: () {},
              ),
              Gap(10),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            BlocProvider.of<AuthCubit>(context).signIn(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                context);
                          },
                    text: state is AuthLoading ? 'Loading...' : "Se connecter",
                  );
                },
              ),
              Column(
                children: [
                  Text(
                    "Vous n'avez pas de compte ?",
                    style: TextThemes.TextStyle14,
                  ),
                  GestureDetector(
                    onTap: () =>
                        BlocProvider.of<AuthCubit>(context).switchState(),
                    child: Text(
                      "S'inscrire",
                      style: TextThemes.TextStyle14.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
