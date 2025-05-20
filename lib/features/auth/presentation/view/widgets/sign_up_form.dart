import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../../core/constants/theme_const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class SingUpForm extends StatelessWidget {
  SingUpForm({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          GoRouter.of(context).push(kHomeView);
        } else if (state is AuthError) {
          print(state.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20,
          children: [
            CustomTextField(
              controller: nameController,
              hintText: 'Nom',
              labelText: 'Nom',
              keyboardType: TextInputType.text,
            ),
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
            CustomTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Mot de passe',
              labelText: 'Confirm Mot de passe',
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            Text(
              "Mot de pass doit contenure au moins  8 entre des  characteres et chiffres",
              style: TextThemes.TextStyle14,
            ),
            Gap(10),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return CustomButton(
                  onPressed: state is AuthLoading
                      ? null
                      : () {
                          if (passwordController.text.trim() !=
                              confirmPasswordController.text.trim()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Passwords do not match")),
                            );
                            return;
                          }
                          BlocProvider.of<AuthCubit>(context).signUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                              context);
                        },
                  text: state is AuthLoading ? 'Loading...' : "S'inscrire",
                );
              },
            ),
            Column(
              children: [
                Text(
                  "Vous avez deja un compte ?",
                  style: TextThemes.TextStyle14,
                ),
                GestureDetector(
                  child: Text(
                    "Se connecter",
                    style: TextThemes.TextStyle14.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () =>
                      BlocProvider.of<AuthCubit>(context).switchState(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
