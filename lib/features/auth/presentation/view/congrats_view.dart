import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/constants/theme_const.dart';
import 'package:labnova/core/utils/styles.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';

import '../../../../core/constants/assets_const.dart';

class CongratsView extends StatelessWidget {
  const CongratsView({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              AssetsData.kCongrats,
              width: 250,
              height: 250,
            ),
            Column(
              children: [
                Text(
                  "Congratulation!",
                  style: TextThemes.TextStyle24,
                ),
                Gap(10),
                Text(
                  "Votre inscription a été réussie",
                  style: TextThemes.TextStyle18.copyWith(
                    color: const Color.fromARGB(137, 89, 89, 89),
                  ),
                ),
              ],
            ),
            CustomButton(
                onPressed: () {
                  GoRouter.of(context).push(kHomeView);
                },
                text: "Découvrir")
          ],
        ),
      ),
    );
  }
}
