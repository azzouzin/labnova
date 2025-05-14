import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/utils/widgets/custom_loading_widget.dart';
import '../viewmodels/manager/splash_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToHome();
  }

  void _navigateToHome() {
    // Wait for the animation to complete before navigating
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Future.delayed(const Duration(milliseconds: 500), () {
        //   if (mounted) {
        //     context.go(
        //         '/home'); // Use context.go instead of GoRouter.of(context).pushReplacement
        //   }
        // });
      }
    });
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _logoScaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _logoScaleAnimation.value,
                          child: Image.asset(
                            AssetsData.logo,
                            height: 75,
                          ),
                        );
                      },
                    ),
                    Gap(12),
                    AnimatedBuilder(
                      animation: _textOpacityAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _textOpacityAnimation.value,
                          child: Text(
                            "Labnova",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 64,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Labnova votre solution de gestion de laboratoire de recherche et développement d'innovation en ligne pour les étudiants et les enseignants",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                const CustomLoadingWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
