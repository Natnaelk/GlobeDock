import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({Key? key}) : super(key: key);

  @override
  State<CelebrationScreen> createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen> {
  ConfettiController? _controllerCenterRight;
  ConfettiController? _controllerCenterLeft;

  @override
  void initState() {
    super.initState();

    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight!.play();
    _controllerCenterLeft!.play();
  }

  @override
  void dispose() {
    _controllerCenterRight!.dispose();
    _controllerCenterLeft!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SMALL_PADDING,
              right: SMALL_PADDING,
              top: 150.h,
            ),
            child: Column(
              children: [
                Text(
                  'Congratulations! Your Profile is Now Complete.',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 13.h),
                Text(
                  'Continue to Homepage to explore more!',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                Images.TROPHY,
                height: 300,
                width: 300,
              )),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight!,
              blastDirection: pi, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              minimumSize: Size(5,
                  5), // set the minimum potential size for the confetti (width, height)
              maximumSize: Size(10, 10), // set the maximum
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
              strokeWidth: 1,
              strokeColor: Theme.of(context).cardColor,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft!,
              blastDirection: 0, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: Size(5,
                  5), // set the minimum potential size for the confetti (width, height)
              maximumSize: Size(10,
                  10), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: CustomIconButton(
          onTap: () => GoRouter.of(context).goNamed(
            AppRoutes.DASHBOARD_ROUTE_NAME,
          ),
          isIconLeading: false,
          label: 'Continue',
          color: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).cardColor,
          icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
        ),
      ),
    );
  }
}
