import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class QuestionOneWidget extends StatelessWidget {
  QuestionOneWidget({Key? key, this.onTap}) : super(key: key);
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Question 1 of 4',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: CustomFontSize.s12,
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(Images.QUESTION_ONE)]),
        SizedBox(
          height: 30.h,
        ),
        Text(
          PREFERRED_LEVEL_OF_STUDY,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
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
              CustomElevatedButton(
                onTap: () => onPressed(context),
                label: HIGHSCHOOL,
                color: Theme.of(context).cardColor,
                labelColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomElevatedButton(
                onTap: () => onPressed(context),
                label: UNDERGRADUATE,
                color: Colors.white,
                labelColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomElevatedButton(
                onTap: () => onPressed(context),
                label: POSTGRADUATE,
                color: Theme.of(context).cardColor,
                labelColor: Theme.of(context).disabledColor,
              )
            ],
          ),
        ),
      ],
    );
  }

  void onPressed(BuildContext context) {
    return GoRouter.of(context).goNamed(AppRoutes.QUESTION_ROUTE_NAME,
        queryParameters: {'questionNumber': '2'});
  }
}