import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_textfield.dart';
import 'package:go_router/go_router.dart';

Widget emailLoginWidget(BuildContext context,
    {String buttonLabel = LOGIN, bool showOTP = true}) {
  return Column(
    children: [
      CustomTextField(
        width: double.infinity,
        height: 45.h,
        labelText: 'Email Address',
      ),
      SizedBox(
        height: 15.h,
      ),
      CustomTextField(
        width: double.infinity,
        height: 35.h,
        labelText: 'OTP',
      ),
      SizedBox(
        height: 10.h,
      ),
      showOTP
          ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            ])
          : SizedBox(),
      SizedBox(
        height: 25.h,
      ),
      CustomElevatedButton(
        onTap: () => GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        label: buttonLabel,
      ),
    ],
  );
}
