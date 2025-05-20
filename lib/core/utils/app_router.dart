import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:labnova/core/models/labo.dart';
import 'package:labnova/features/appointment/presentation/view/appointment_form.dart';
import 'package:labnova/features/appointment/presentation/view/get_appoitment.dart';
import 'package:labnova/features/appointment/presentation/view_model/cubit/appoitment_cubit.dart';
import 'package:labnova/features/auth/presentation/view/confirm_otp.dart';
import 'package:labnova/features/auth/presentation/view/congrats_view.dart';
import 'package:labnova/features/auth/presentation/view/sign_up_view.dart';
import 'package:labnova/features/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:labnova/features/labs/presentation/view/lab_detail.dart';
import 'package:labnova/features/labs/presentation/view/labs_view.dart';
import 'package:labnova/features/workers/presentation/view/chat_view.dart';
import 'package:labnova/features/workers/presentation/view/workers_view.dart';
import '../../features/home/data/model/book_model.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/home/presentation/view_models/simmilair_books/simmilair_books_cubit.dart';

import '../../features/splash/presentation/view/splash_view.dart';
import '../constants/theme_const.dart';
import '../models/user.dart';
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
              BlocProvider<HomeCubit>(
                create: (context) => HomeCubit(
                  getIt.get<HomeRepoImpl>(),
                ),
              ),
              BlocProvider<AuthCubit>(
                create: (context) => AuthCubit(),
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
              child: SignUpView(),
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
          GoRoute(
            path: kLabDetailView,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: LabDetailView(lab: state.extra as LaboModel),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kGetAppointment,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => AppoitmentCubit(),
                child: GetAppoitmentView(
                  laboModel: state.extra as LaboModel,
                ),
              ),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kFrom,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => AppoitmentCubit(),
                child: AppointmentFrom(
                  laboModel: state.extra as LaboModel,
                ),
              ),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kWorkers,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => AppoitmentCubit(),
                child: WorkersView(title: state.extra as String),
              ),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
          GoRoute(
            path: kChatScreen,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => AppoitmentCubit(),
                child: ChatScreen(
                  user: state.extra as User,
                ),
              ),
              transitionsBuilder: CustomPageTransitions.slideTransition,
            ),
          ),
        ],
      ),
    ],
  );
}
