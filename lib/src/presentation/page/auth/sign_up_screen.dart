import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:globedock/src/presentation/widget/country_picker_widget.dart';
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
  String? _countryDialCode;
  @override
  void initState() {
    _countryDialCode = '+251';
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
        backgroundColor: Theme.of(context).bottomAppBarColor,
        appBar: CustomAppBar(
          isBackButtonExist: true,
          onBackButtonPressed: () =>
              GoRouter.of(context).go(AppRoutes.ONBOARDING_ROUTE_PATH),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 75.h),
              child: Column(
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
                        width: 95.w,
                        height: 35.h,
                        isWidget: true,
                        childWidget: CodePickerWidget(
                          alignLeft: true,
                          onChanged: (CountryCode countryCode) {
                            setState(() {
                              _countryDialCode = countryCode.dialCode;
                            });
                          },
                          initialSelection: 'ET',
                          favorite: [_countryDialCode!],
                          flagDecoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)),
                          showCountryOnly: true,
                          showDropDownButton: true,
                          backgroundColor: Theme.of(context).cardColor,
                          flagWidth: 30,
                          hideMainText: true,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: CustomTextField(
                        width: double.infinity,
                        height: 35.h,
                        labelText: 'Mobile number',
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _showOTPField && !_isPhoneVerified
                      ? Column(children: [
                          CustomTextField(
                            width: double.infinity,
                            height: 35.h,
                            labelText: 'OTP',
                          ),
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
                      : SizedBox(),
                  SizedBox(
                    height: 15.h,
                  ),
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
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).go(AppRoutes.SIGNIN_ROUTE_PATH);
                      },
                      child: Text(
                        LOGIN,
                        style: TextStyle(
                            fontSize: CustomFontSize.s10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  ]),
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
