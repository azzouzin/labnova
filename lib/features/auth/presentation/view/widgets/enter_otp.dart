import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class EnterOtpView extends StatelessWidget {
  const EnterOtpView({
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        // Auto-focus to next field when a digit is entered
                        if (value.length == 1 && index < 4) {
                          FocusScope.of(context).nextFocus();
                        }
                        // Move focus back when deleting
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Gap(128),
              CustomButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).seccessOTP(context);
                  },
                  text: "Confimer")
            ],
          ),
        ),
      ],
    );
  }
}
