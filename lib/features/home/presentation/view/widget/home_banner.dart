import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/assets_const.dart';
import '../../../../../core/utils/styles.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsData.rendezVous,
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          Text(
            "Prenez Rendez-Vous \nDès Aujourd’hui !",
            style: TextThemes.TextStyle20.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(10),
          Text(
            "Rapide. Facile. Sans tracas.",
            style: TextThemes.TextStyle16.copyWith(
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          Gap(20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  "Voir plus",
                  style: TextStyle(color: Colors.white),
                ),
                Gap(10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
