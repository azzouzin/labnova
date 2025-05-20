import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labnova/core/constants/assets_const.dart';
import 'package:labnova/core/utils/widgets/custom_button.dart';
import 'package:labnova/core/utils/widgets/custom_text_field.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/enter_otp.dart';
import 'widgets/enter_phone_form.dart';

class ConfirmOtp extends StatelessWidget {
  const ConfirmOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final enterPhoneView = EnterPhoneView(size: size);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsData.kmainBG,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            switch (state) {
              case AuthEnterOTP():
                return EnterOtpView(size: size);
              case AuthEnterPhone():
                return enterPhoneView;
              default:
                return enterPhoneView;
            }
          },
        ),
      ),
    );
  }
}
