import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: SPACE60.h, left: SPACE15, right: SPACE15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(Images.LOGIN),
                ],
              ),
              SizedBox(
                height: SPACE20.h,
              ),
              Text(
                JOURNEY_STARTS_HERE,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: SPACE12.h,
              ),
              Text(
                JOIN_US,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: SPACE35.h,
              ),
              CustomIconButton(
                onTap: () =>
                    GoRouter.of(context).go(AppRoutes.SIGNIN_ROUTE_PATH),
                label: EMAIL_OR_PHONE,
                labelColor: Theme.of(context).cardColor,
                icon: SvgPicture.asset(Images.EMAIL_LOGIN),
                color: Theme.of(context).dialogBackgroundColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomIconButton(
                onTap: () {},
                label: GOOGLE,
                labelColor: Theme.of(context).dialogBackgroundColor,
                icon: SvgPicture.asset(Images.GOOGLE_LOGIN),
                color: Theme.of(context).cardColor,
                borderColor: Theme.of(context).canvasColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomIconButton(
                onTap: () {},
                label: APPLE,
                labelColor: Theme.of(context).dialogBackgroundColor,
                icon: SvgPicture.asset(
                  Images.APPLE_LOGIN,
                  height: 20.h,
                  width: 20.w,
                ),
                color: Theme.of(context).cardColor,
                borderColor: Theme.of(context).canvasColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: SPACE50),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: SPACE35),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DONT_HAVE_AN_ACCOUNT,
                                style: TextStyle(
                                    fontSize: CustomFontSize.s11,
                                    color: Theme.of(context).disabledColor),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () => GoRouter.of(context)
                                    .go(AppRoutes.SIGNUP_ROUTE_PATH),
                                child: Text(
                                  SIGN_UP_FOR_FREE,
                                  style: TextStyle(
                                      fontSize: CustomFontSize.s10,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              )
                            ]),
                        SizedBox(
                          height: SPACE20.h,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By continuing, you agree to GlobDock\'s',
                                style: TextStyle(
                                    fontSize: CustomFontSize.s8,
                                    color: Theme.of(context).disabledColor),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Terms & Conditions and Privacy Policy',
                                style: TextStyle(
                                    fontSize: CustomFontSize.s8,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              )
                            ])
                      ],
                    )),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
