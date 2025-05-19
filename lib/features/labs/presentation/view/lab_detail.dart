import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/constants/assets_const.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';

import '../../../../core/constants/theme_const.dart';
import '../../../../core/models/labo.dart';
import '../../../../core/utils/styles.dart';

class LabDetailView extends StatelessWidget {
  final LaboModel lab;

  LabDetailView({
    Key? key,
    required this.lab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //Detail d’établissement
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lab Image
                Gap(64),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                    Gap(32),
                    Text(
                      "Detail d’établissement",
                      style: TextThemes.TextStyle18.copyWith(
                        color: Theme.of(context).colorScheme.shadow,
                      ),
                    ),
                  ],
                ),
                Gap(32),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(AssetsData.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                // Lab Details
                Text(
                  lab.name,
                  style: TextThemes.TextStyle24,
                ),

                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text("Sidi bel abbass"),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text("05 62 41 39 35"),
                ),
                ...List.generate(
                  lab.parameters.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.supervised_user_circle),
                        Gap(10),
                        Text(
                          lab.parameters[index],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(32),
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(kGetAppointment);
                  },
                  text: "Prenez Rendez-Vous",
                ),
                Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
