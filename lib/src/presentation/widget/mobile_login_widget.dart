import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_textfield.dart';

Widget mobileLoginWidget(BuildContext context) {
  return Column(
    children: [
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
              child: CustomTextField(width: double.infinity, height: 35.h)),
        ],
      ),
      SizedBox(
        height: 25.h,
      ),
      CustomElevatedButton(
        onTap: () {},
        label: SEND_OTP,
      ),
    ],
  );
}
