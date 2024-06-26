import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_textfield.dart';
import 'package:go_router/go_router.dart';

Widget registerWidget(BuildContext context) {
  return Column(
    children: [
      CustomTextField(
        width: double.infinity,
        height: 35.h,
        labelText: 'Full Name',
      ),
      SizedBox(
        height: 15.h,
      ),
      CustomTextField(
        width: double.infinity,
        height: 35.h,
        labelText: 'Email',
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          AGREEMENT_TXT,
          style: TextStyle(
              fontSize: CustomFontSize.s8,
              color: Theme.of(context).disabledColor),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          TERMS_AND_CONDITIONS,
          style: TextStyle(
              fontSize: CustomFontSize.s8,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        )
      ]),
      SizedBox(
        height: 25.h,
      ),
      CustomElevatedButton(
        onTap: () =>
            GoRouter.of(context).go(AppRoutes.QUESTION_ONBOARDING_ROUTE_PATH),
        label: SIGN_UP,
      ),
    ],
  );
}
