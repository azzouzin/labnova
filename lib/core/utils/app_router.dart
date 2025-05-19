import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/features/auth/presentation/view/confirm_otp.dart';
import 'package:labnova/features/auth/presentation/view/congrats_view.dart';
import 'package:labnova/features/auth/presentation/view/sign_up_view.dart';
import 'package:labnova/features/labs/presentation/view/labs_view.dart';
import '../../features/home/data/model/book_model.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/home/presentation/view_models/simmilair_books/simmilair_books_cubit.dart';

import '../../features/splash/presentation/view/splash_view.dart';
import '../constants/theme_const.dart';
import 'api_service.dart';
import 'custom_page_transitions.dart';
import 'service_locator.dart';

abstract class AppRouter {
  // Create a ShellRoute that wraps all routes with the necessary BlocProviders
  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeCubit(
                  getIt.get<HomeRepoImpl>(),
                ),
              ),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const SplashView(),
          ),
          GoRoute(
            path: kHomeView,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const HomeView(),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kAuthView,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SignUpView(),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kOtpView,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ConfirmOtp(),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kCongrats,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const CongratsView(),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kLabsView,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LabsView(),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
        ],
      ),
    ],
  );
}
