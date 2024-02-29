import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class JourneyProgressWidget extends StatelessWidget {
  const JourneyProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RADIUS),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Journey Progress',
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CircularStepProgressIndicator(
          totalSteps: 9,
          currentStep: 1,
          stepSize: 10,
          selectedColor: Theme.of(context).primaryColor,
          unselectedColor: Theme.of(context).primaryColorLight,
          padding: 0,
          width: 300,
          height: 300,
          selectedStepSize: 18,
          startingAngle: 2 * 3.5 / math.pi,
          arcSize: math.pi * 1.4,
          roundedCap: (_, __) => true,
          removeRoundedCapExtraAngle: false,
          circularDirection: CircularDirection.clockwise,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '1/9',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Stage Completed',
                        style: TextStyle(
                          color: Theme.of(context).dialogBackgroundColor,
                          fontSize: CustomFontSize.s15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Current Stage',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            'Up Next',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile Building',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            'Shortlisting',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: CustomIconButton(
            onTap: () {},
            label: 'Track Your Journey',
            color: Theme.of(context).cardColor,
            labelColor: Theme.of(context).primaryColor,
            icon: SvgPicture.asset(
              CustomIcons.FORWARD_ARROW,
              color: Theme.of(context).primaryColor,
            ),
            isIconLeading: false,
            showBorder: false,
          ),
        )
      ]),
    );
  }
}
