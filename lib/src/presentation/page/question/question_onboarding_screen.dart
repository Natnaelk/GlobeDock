import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class QuestionOnboardingScreen extends StatelessWidget {
  const QuestionOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(Images.QUESTION_ONBOARDING)]),
            SizedBox(
              height: 30.h,
            ),
            Text(
              COMPLETE_PROFIE,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
              child: Column(
                children: [
                  Text(
                    PERSONALIZE_INFO,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomIconButton(
                    onTap: () => GoRouter.of(context).goNamed(
                        AppRoutes.QUESTION_ROUTE_NAME,
                        queryParameters: {'questionNumber': '1'}),
                    label: LETS_GO,
                    color: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).cardColor,
                    icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
                    isIconLeading: false,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
