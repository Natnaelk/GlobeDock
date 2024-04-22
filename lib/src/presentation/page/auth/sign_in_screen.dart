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
  late PageController _pageController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        appBar: CustomAppBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          isBackButtonExist: false,
          onBackButtonPressed: () =>
              GoRouter.of(context).go(AppRoutes.ONBOARDING_ROUTE_PATH),
        ),
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                        border:
                            Border.all(color: Theme.of(context).canvasColor),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        indicator: const BoxDecoration(),
                        dividerColor: Theme.of(context).bottomAppBarColor,
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
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _tabController.index = index;
                          });
                        },
                        children: [
                          MobileLoginTab(),
                          emailLoginWidget(context),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned.fill(
              top: _tabController.index == 0
                  ? MediaQuery.of(context).size.height * 0.39
                  : MediaQuery.of(context).size.height * 0.51,
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
                        ' $SIGN_UP_FOR_FREE',
                        style: TextStyle(
                            fontSize: CustomFontSize.s10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: SPACE60.h,
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
