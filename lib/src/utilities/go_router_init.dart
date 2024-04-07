import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/auth/sign_up_screen.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/page/chat/chat_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/chat/chat_room_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/help_me_with_visa_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/matched_with_my_team_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/my_profile_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/ready_to_fly_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/university_application_mgmt_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/visa_mgmt_screen.dart';
import 'package:globedock/src/presentation/page/destination/destination_screen.dart';
import 'package:globedock/src/presentation/page/error/error_screen.dart';
import 'package:globedock/src/presentation/page/helpandsupport/help_and_support_screen.dart';
import 'package:globedock/src/presentation/page/home/fill_profile_details_screen.dart';
import 'package:globedock/src/presentation/page/home/upload_documents_screen.dart';
import 'package:globedock/src/presentation/page/onboarding/complete_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/onboarding/onboarding_screen.dart';
import 'package:globedock/src/presentation/page/auth/sign_in_screen.dart';
import 'package:globedock/src/presentation/page/profile/profile_screen.dart';
import 'package:globedock/src/presentation/page/question/question_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/question/question_screen.dart';
import 'package:globedock/src/presentation/page/splash/splash_screen.dart';
import 'package:globedock/src/presentation/page/universities/universities_detail_screen.dart';
import 'package:globedock/src/presentation/page/universities/universities_view_all_screen.dart';
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
        print('It gets here on init');
        return BottomNavigationScreen(
            selectedIndex: state.uri.queryParameters['index']);
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

    GoRoute(
      name: AppRoutes.PROFILE_ROUTE_NAME,
      path: AppRoutes.PROFILE_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.CHAT_ONBORADING_ROUTE_NAME,
      path: AppRoutes.CHAT_ONBORADING_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const ChatOnboardingScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.CHAT_ROOM_ROUTE_NAME,
      path: AppRoutes.CHAT_ROOM_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const ChatRoomScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.MATCHED_WITH_TEAM_ROUTE_NAME,
      path: AppRoutes.MATCHED_WITH_TEAM_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const MatchedWithMyTeamScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.MY_PROFILE_ROUTE_NAME,
      path: AppRoutes.MY_PROFILE_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const MyProfileScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.UNIVERSITY_APPLICATION_MGMT_ROUTE_NAME,
      path: AppRoutes.UNIVERSITY_APPLICATION_MGMT_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const UniversityApplicationMgmtScreen();
      },
    ),

    // GoRoute(
    //   name: AppRoutes.UNIVERSITY_APPLICATION_MGMT_ROUTE_NAME,
    //   path: AppRoutes.UNIVERSITY_APPLICATION_MGMT_ROUTE_PATH,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const UniversityApplicationMgmtScreen();
    //   },
    // ),

    GoRoute(
      name: AppRoutes.VISA_MGMT_ROUTE_NAME,
      path: AppRoutes.VISA_MGMT_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const VisaMgmtScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.HELP_WITH_VISA_ROUTE_NAME,
      path: AppRoutes.HELP_WITH_VISA_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const HelpMeWithVisaScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.READY_TO_FLY_ROUTE_NAME,
      path: AppRoutes.READY_TO_FLY_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const ReadyToFlyScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.DESTINATION_ROUTE_NAME,
      path: AppRoutes.DESTINATION_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const DestinationScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.HELP_ROUTE_NAME,
      path: AppRoutes.HELP_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const HelpAndSupportScreen();
      },
    ),

    GoRoute(
      name: AppRoutes.UNIVERSITIES_ROUTE_NAME,
      path: AppRoutes.UNIVERSITIES_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const UniversitiesViewAllScreen();
      },
    ),
    GoRoute(
      name: AppRoutes.UNIVERSITIES_DETAIL_ROUTE_NAME,
      path: AppRoutes.UNIVERSITIES_DETAIL_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const UniversitiesDetailScreen();
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
