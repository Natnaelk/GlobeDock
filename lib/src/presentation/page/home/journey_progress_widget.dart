import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class JourneyProgressWidget extends StatelessWidget {
  const JourneyProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
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
              style: GoogleFonts.rubik(
                color: ColorLight.fontTitle,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CircularStepProgressIndicator(
          totalSteps: 9,
          currentStep: 1,
          stepSize: 6,
          selectedColor: Theme.of(context).primaryColor,
          unselectedColor: Theme.of(context).primaryColorLight,
          padding: 0,
          width: 228,
          height: 228,
          selectedStepSize: 18,
          startingAngle: 2 * 3.5 / math.pi,
          arcSize: math.pi * 1.4,
          roundedCap: (_, __) => true,
          removeRoundedCapExtraAngle: false,
          circularDirection: CircularDirection.clockwise,
          child: Container(
            //   alignment: Alignment.bottomCenter,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(
                      //   height: 60,
                      // ),
                      Text(
                        '1/9',
                        style: GoogleFonts.rubik(
                          color: ColorLight.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        'Stages Completed',
                        style: TextStyle(
                          color: Theme.of(context).dialogBackgroundColor,
                          fontSize: CustomFontSize.s12,
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
                      // SizedBox(
                      //   height: 55.h,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Current Stage',
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorLight.fontSubtitle,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Up Next',
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorLight.fontSubtitle,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile Building',
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorLight.fontTitle,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Shortlisting',
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorLight.fontTitle,
                              fontWeight: FontWeight.w500,
                            ),
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
        SizedBox(
          height: 15.h,
        ),
        Center(
          child: CustomIconButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavigationScreen(
                        selectedIndex: '2',
                      )),
            ),
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
