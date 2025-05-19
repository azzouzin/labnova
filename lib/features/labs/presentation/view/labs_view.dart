import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/constants/data_constants.dart';
import 'package:labnova/core/utils/widgets/custom_text_field.dart';
import 'package:labnova/features/home/presentation/view/widget/labo_card.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/utils/styles.dart';

class LabsView extends StatelessWidget {
  const LabsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.kmainBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Gap(64),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).colorScheme.shadow,
                  ),
                  Gap(32),
                  Text(
                    "Les Établissements de Santé",
                    style: TextThemes.TextStyle18.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                ],
              ),
              Gap(32),
              CustomTextField(
                controller: TextEditingController(),
                labelText: "Rechercher",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        etablissments.length,
                        (index) => LaboCard(
                          laboModel: etablissments[index],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
