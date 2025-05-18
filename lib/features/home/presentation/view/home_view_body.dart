import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/utils/styles.dart';

import '../../../../core/constants/assets_const.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        child: Column(
          children: [
            Gap(32),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: 70,
                      height: 70,
                      color: Colors.white,
                      child: Image.asset(AssetsData.logo),
                    ),
                  ),
                  Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bonjour",
                        style: TextThemes.TextStyle14,
                      ),
                      Gap(10),
                      Text(
                        "Setifis Tech",
                        style: TextThemes.TextStyle20,
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.notifications,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
