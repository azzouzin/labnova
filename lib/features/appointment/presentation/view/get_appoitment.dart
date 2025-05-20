// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:labnova/core/constants/theme_const.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/features/appointment/presentation/view_model/cubit/appoitment_cubit.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/constants/data_constants.dart';
import '../../../../core/models/labo.dart';
import '../../../../core/models/user.dart';
import '../../../../core/utils/styles.dart';

class GetAppoitmentView extends StatelessWidget {
  GetAppoitmentView({
    Key? key,
    required this.laboModel,
  }) : super(key: key);

  final LaboModel laboModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: const Text("Conditions de prélèvement")),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Gap(64),
              Row(
                children: [
                  IconButton(
                    onPressed: GoRouter.of(context).pop,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                  Gap(32),
                  Text(
                    "Conditions de prélèvement",
                    style: TextThemes.TextStyle18.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
                  ),
                ],
              ),
              // Gap(32),
              Expanded(
                child: ListView.builder(
                  itemCount: conditions.length,
                  itemBuilder: (context, index) {
                    final condition = conditions[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              condition.test,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...condition.instructions.map((instruction) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("• ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Expanded(child: Text(instruction)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<AppoitmentCubit, AppoitmentState>(
                builder: (context, state) {
                  return CheckboxListTile(
                    title: const Text("J'ai lu et j'approuve les conditions"),
                    value: state is AppoitmentApproved,
                    onChanged: (value) =>
                        BlocProvider.of<AppoitmentCubit>(context)
                            .switchApproved(),
                  );
                },
              ),
              BlocBuilder<AppoitmentCubit, AppoitmentState>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: state is AppoitmentApproved
                        ? () {
                            GoRouter.of(context).push(
                              kFrom,
                              extra: laboModel,
                            );
                          }
                        : null,
                    text: "Continuer",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
