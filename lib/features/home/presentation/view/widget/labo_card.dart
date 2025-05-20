import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/models/labo.dart';

import '../../../../../core/constants/assets_const.dart';
import '../../../../../core/constants/theme_const.dart';
import '../../../../../core/utils/styles.dart';

class LaboCard extends StatelessWidget {
  const LaboCard({
    super.key,
    required this.laboModel,
  });
  final LaboModel laboModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(kLabDetailView, extra: laboModel),
      child: Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsData.logo,
              width: 120,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Gap(10),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 200,
                        child: Text(
                          laboModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextThemes.TextStyle16.copyWith(
                              color: Theme.of(context).shadowColor),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.bookmark,
                        color: Theme.of(context).primaryColor,
                      ),
                      Gap(10)
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Theme.of(context).shadowColor,
                      ),
                      Gap(5),
                      Text(
                        "Sidi Bel Abbes",
                        style: TextThemes.TextStyle16.copyWith(
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 24,
                      ),
                      Gap(5),
                      Text(
                        "5.0",
                        style: TextThemes.TextStyle16.copyWith(
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "voir plus",
                        style: TextThemes.TextStyle16.copyWith(
                          color: Theme.of(context).shadowColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Gap(10)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
