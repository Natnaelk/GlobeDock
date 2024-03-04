import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/auth/sign_up_screen.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/page/error/error_screen.dart';
import 'package:globedock/src/presentation/page/home/fill_profile_details_screen.dart';
import 'package:globedock/src/presentation/page/home/upload_documents_screen.dart';
import 'package:globedock/src/presentation/page/onboarding/complete_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/onboarding/onboarding_screen.dart';
import 'package:globedock/src/presentation/page/auth/sign_in_screen.dart';
import 'package:globedock/src/presentation/page/question/question_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/question/question_screen.dart';
import 'package:globedock/src/presentation/page/splash/splash_screen.dart';
import 'package:globedock/src/presentation/page/videos/videos_screen.dart';
import 'package:globedock/src/presentation/premium/premium_plans_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routerinit = GoRouter(
  routes: <RouteBase>[
    ///  =================================================================
    ///  ********************** Splash Route *****************************
    /// ==================================================================

    GoRoute(
      name: AppRoutes.ONBOARDING_ROUTE_NAME,
      path: AppRoutes.ONBOARDING_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      name: AppRoutes.SPLASH_ROUTE_NAME,
      path: AppRoutes.SPLASH_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    ///  =================================================================
    /// ********************** Authentication Routes ********************
    /// ==================================================================
    GoRoute(
      name: AppRoutes.SIGNIN_ROUTE_NAME,
      path: AppRoutes.SIGNIN_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.SIGNUP_ROUTE_NAME,
      path: AppRoutes.SIGNUP_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.QUESTION_ONBOARDING_ROUTE_NAME,
      path: AppRoutes.QUESTION_ONBOARDING_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const QuestionOnboardingScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.QUESTION_ROUTE_NAME,
      path: AppRoutes.QUESTION_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return QuestionScreen(
            questionNumber: state.uri.queryParameters['questionNumber']);
      },
    ),

    GoRoute(
      name: AppRoutes.DASHBOARD_ROUTE_NAME,
      path: AppRoutes.DASHBOARD_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavigationScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.COMPLETE_ONBOARDING_ROUTE_NAME,
      path: AppRoutes.COMPLETE_ONBOARDING_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const CompleteOnboardingScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.FILL_PROFILE_ROUTE_NAME,
      path: AppRoutes.FILL_PROFILE_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const FillProfileDetilsScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.UPLOAD_DOCUMENTS_ROUTE_NAME,
      path: AppRoutes.UPLOAD_DOCUMENTS_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const UploadDocumentsScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.VIDEOS_ROUTE_NAME,
      path: AppRoutes.VIDEOS_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const VideosScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.PREMIUM_PLAN_ROUTE_NAME,
      path: AppRoutes.PREMIUM_PLAN_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const PremiumPlansScreen();
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: ErrorScreen());
  },
  redirect: (context, state) {
    log('redirect: ${state.uri}');
    return null;
  },
);
