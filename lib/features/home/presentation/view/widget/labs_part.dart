import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/constants/theme_const.dart';

import '../../../../../core/constants/data_constants.dart';
import '../../../../../core/utils/styles.dart';
import 'labo_card.dart';

class Labs extends StatelessWidget {
  const Labs({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () => GoRouter.of(context).push(kLabsView),
            child: Row(
              children: [
                Text(
                  "Les Établissements de Santé",
                  style: TextThemes.TextStyle16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          Gap(20),
          LaboCard(laboModel: etablissments.first),
          Gap(20),
          LaboCard(laboModel: etablissments.first),
          Gap(20),
        ],
      ),
    );
  }
}
