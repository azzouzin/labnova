import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/constants/data_constants.dart';
import 'package:labnova/core/utils/styles.dart';

import '../../../../core/constants/assets_const.dart';
import 'widget/home_banner.dart';
import 'widget/home_header.dart';
import 'widget/labo_card.dart';
import 'widget/labs_part.dart';
import 'widget/our_services.dart';

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
            Gap(82),
            HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(32),
                    HomeBanner(size: size),
                    OurServices(size: size),
                    Gap(32),
                    Labs(size: size),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
