import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/constants/assets_const.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/core/utils/widgets/custom_text_field.dart';

import '../../../../core/utils/styles.dart';

class ConfirmOtp extends StatelessWidget {
  const ConfirmOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.kmainBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
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
                  CustomButton(onPressed: () {}, text: "Confimer")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
