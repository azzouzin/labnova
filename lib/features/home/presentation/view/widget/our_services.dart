import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/data_constants.dart';
import '../../../../../core/utils/styles.dart';

class OurServices extends StatelessWidget {
  const OurServices({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Gap(32),
          Row(
            children: [
              Text(
                "Nos Service",
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
          Gap(10),
          SizedBox(
            width: size.width,
            height: size.height * 0.15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              separatorBuilder: (context, index) => Gap(5),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/${services[index].image}",
                    ),
                    Gap(5),
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Gap(5),
                        Text(
                          services[index].name,
                          style: TextThemes.TextStyle14.copyWith(
                            letterSpacing: 2,
                            color: Colors.black87,
                          ),
                        ),
                        Gap(5),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
