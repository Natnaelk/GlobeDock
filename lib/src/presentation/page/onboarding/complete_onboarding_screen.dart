import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/widget/custom_app_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CompleteOnboardingScreen extends StatelessWidget {
  const CompleteOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentStep = 2;
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: 'Complete Your Onboarding',
        onBackButtonPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.PLANE,
                    color: Theme.of(context).primaryColor,
                    width: 28,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: StepProgressIndicator(
                        totalSteps: 5,
                        currentStep: currentStep,
                        size: 50,
                        selectedColor: Colors.black,
                        padding: 0,
                        unselectedColor: Colors.grey,
                        direction: Axis.horizontal,
                        customStep: (index, color, _) => color == Colors.black
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 25,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Container(
                                    height: 12,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 25,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  Container(
                                    height: 12,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(
                      CustomIcons.RADIO_PROGRESS_INDICATOR_NOTSELECTED,
                      color: Theme.of(context).disabledColor,
                      width: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
