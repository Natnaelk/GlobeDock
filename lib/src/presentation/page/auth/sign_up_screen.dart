import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:globedock/src/presentation/widget/custom_app_bar.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_textfield.dart';
import 'package:globedock/src/presentation/widget/register_widget.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  bool _showOTPField = false;
  bool _isPhoneVerified = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        appBar: CustomAppBar(
          isBackButtonExist: true,
          onBackButtonPressed: () =>
              GoRouter.of(context).go(AppRoutes.ONBOARDING_ROUTE_PATH),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 250.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        CREATE_ACCOUNT,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: 80.w,
                        height: 35.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: CustomTextField(
                              width: double.infinity, height: 35.h)),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _showOTPField && !_isPhoneVerified
                      ? Column(children: [
                          CustomTextField(width: double.infinity, height: 35.h),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  RESEND_OTP,
                                  style: TextStyle(
                                      fontSize: CustomFontSize.s10,
                                      color: Theme.of(context).disabledColor),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  '00:40s',
                                  style: TextStyle(
                                      fontSize: CustomFontSize.s10,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                )
                              ]),
                        ])
                      : const SizedBox(),
                  _isPhoneVerified ? registerWidget(context) : SizedBox(),
                  SizedBox(
                    height: 10.h,
                  ),
                  !_isPhoneVerified
                      ? CustomElevatedButton(
                          onTap: () {
                            setState(() {
                              if (_showOTPField == false) {
                                _showOTPField = true;
                              } else {
                                _isPhoneVerified = true;
                              }
                            });
                          },
                          label: VERIFY,
                        )
                      : SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: SPACE15.h,
            ),
            Positioned.fill(
              top: _showOTPField == true
                  ? MediaQuery.of(context).size.height * 0.48
                  : MediaQuery.of(context).size.height * 0.41,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      HAVE_AN_ACCOUNT,
                      style: TextStyle(
                          fontSize: CustomFontSize.s10,
                          color: Theme.of(context).disabledColor),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      LOGIN,
                      style: TextStyle(
                          fontSize: CustomFontSize.s10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    )
                  ]),
                  SizedBox(
                    height: SPACE45.h,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(Images.SIGN_IN_COUNTRIES),
            ),
          ],
        ),
      ),
    );
  }
}
