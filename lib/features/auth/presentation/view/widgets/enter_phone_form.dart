import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class EnterPhoneView extends StatelessWidget {
  const EnterPhoneView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(size.height * 0.05),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Text(
              "Confirmer votre compte",
              style: TextThemes.TextStyle20,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Alignez les enfants à l,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Gap(128),
              Text(
                "Numéro Téléphone",
                style: TextThemes.TextStyle16.copyWith(
                  color: Theme.of(context).colorScheme.shadow,
                ),
              ),
              Gap(8),
              CustomTextField(
                controller: TextEditingController(),
                hintText: '+213 654 789 01',
                labelText: 'Num Téléphone',
              ),
              Gap(128),
              CustomButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).switchOTP();
                  },
                  text: "Confimer")
            ],
          ),
        ),
      ],
    );
  }
}
