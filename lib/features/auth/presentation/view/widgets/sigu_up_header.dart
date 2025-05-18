import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/styles.dart';
import '../../view_model/cubit/auth_cubit.dart';

class SignUPHeader extends StatelessWidget {
  const SignUPHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.06),
            child: Container(
              width: size.width * 0.01,
              height: size.height * 0.1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.06),
              Text(
                'LABNOVA',
                style: TextThemes.TextStyle24,
              ),
              Gap(8),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Text(
                    state is AuthSignIN
                        ? 'Connectez-vous pour continuer.'
                        : 'Crée votre compte',
                    style: TextThemes.TextStyle14,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
