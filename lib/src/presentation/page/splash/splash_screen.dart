import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0, microseconds: 900), () {
      GoRouter.of(context).goNamed(AppRoutes.ONBOARDING_ROUTE_NAME);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticatorWatcherBloc, AuthenticatorWatcherState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          authenticating: (_) {},
          authenticated: (_) {},
          isFirstTime: (_) {},
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Images.LOGO),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: SPACE15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: SPACE35),
                  child: LoadingAnimationWidget.waveDots(
                    color: Theme.of(context).primaryColor,
                    size: SPACE35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
