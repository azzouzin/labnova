import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../view_model/cubit/auth_cubit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Numéro Téléphone',
              labelText: 'Numéro Téléphone',
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              keyboardType: TextInputType.text,
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
            CustomButton(onPressed: () {}, text: "Se connecter"),
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
    );
  }
}
