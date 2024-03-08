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
import 'package:globedock/src/presentation/widget/custom_tab.dart';
import 'package:globedock/src/presentation/widget/email_login_widget.dart';
import 'package:globedock/src/presentation/widget/mobile_login_widget.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_tabController.index.toString());
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
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 270.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        LOGIN_TO_CONTINUE,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(RADIUS),
                      border: Border.all(color: Theme.of(context).canvasColor),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.w),
                      indicator: const BoxDecoration(),
                      tabs: [
                        CustomTab(
                          text: MOBILE,
                          isSelected: _tabController.index == 0,
                          haveBorderColor: false,
                        ),
                        CustomTab(
                          text: EMAIL,
                          isSelected: _tabController.index == 1,
                          haveBorderColor: false,
                        ),
                      ],
                      onTap: (index) {
                        setState(() {
                          _tabController.index = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.33,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    mobileLoginWidget(context),
                    emailLoginWidget(context),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SPACE15.h,
            ),
            Positioned.fill(
              top: _tabController.index == 0
                  ? MediaQuery.of(context).size.height * 0.51
                  : MediaQuery.of(context).size.height * 0.65, //
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      NEW_TO_GLOBEDOCK,
                      style: TextStyle(
                          fontSize: CustomFontSize.s10,
                          color: Theme.of(context).disabledColor),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).go(AppRoutes.SIGNUP_ROUTE_PATH),
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
                    height: SPACE45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Version 1.0.0 (Latest)',
                        style: TextStyle(
                            fontSize: CustomFontSize.s10,
                            color: Theme.of(context).disabledColor),
                      ),
                    ],
                  )
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
