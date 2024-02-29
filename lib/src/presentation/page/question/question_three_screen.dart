import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class QuestionThreeScreen extends StatelessWidget {
  const QuestionThreeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Theme.of(context).dialogBackgroundColor,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4.5),
                child: Text(
                  'Question 3 of 4',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: CustomFontSize.s12,
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(Images.QUESTION_THREE)]),
        SizedBox(
          height: 40.h,
        ),
        Text(
          HIGHSCHOOL_ATTENDED,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
          child: Column(
            children: const [
              CustomTextFormField(
                labelText: 'Highschool Name',
              )
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
          child: CustomElevatedButton(
            onTap: () => GoRouter.of(context).goNamed(
                AppRoutes.QUESTION_ROUTE_NAME,
                queryParameters: {'questionNumber': '4'}),
            label: 'Continue',
          ),
        )
      ],
    );
  }
}
