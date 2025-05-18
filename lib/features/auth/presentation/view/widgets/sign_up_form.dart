import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20,
          children: [
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Nom',
              labelText: 'Nom',
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Prénom',
              labelText: 'Prénom',
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Email',
              labelText: 'Email',
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Mot de passe',
              labelText: 'Mot de passe',
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Confirm Mot de passe',
              labelText: 'Confirm Mot de passe',
              keyboardType: TextInputType.text,
            ),
            Text(
              "Mot de pass doit contenure au moins  8 entre des  characteres et chiffres",
              style: TextThemes.TextStyle14,
            ),
            Gap(10),
            CustomButton(
                onPressed: () =>
                    BlocProvider.of<AuthCubit>(context).signUp(context),
                text: "S'inscrire"),
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
