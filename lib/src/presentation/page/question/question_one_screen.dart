import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/question/question_two_screen.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class QuestionOneWidget extends StatelessWidget {
  QuestionOneWidget({Key? key, this.onTap}) : super(key: key);
  VoidCallback? onTap;
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
                icon: const Icon(Icons.chevron_left),
                color: Theme.of(context).dialogBackgroundColor,
                onPressed: () => GoRouter.of(context).goNamed(
                  AppRoutes.QUESTION_ONBOARDING_ROUTE_NAME,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4),
                child: Text(
                  'Question 1 of 4',
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
            children: [SvgPicture.asset(Images.LEVEL_OF_EDUCATION)]),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            PREFERRED_LEVEL_OF_STUDY,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
          child: Column(
            children: [
              Text(
                'This will help us find the right study options for you.',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomElevatedButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionTwoWidget())),
                label: HIGHSCHOOL,
                color: Theme.of(context).cardColor,
                labelColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomElevatedButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionTwoWidget())),
                label: UNDERGRADUATE,
                color: Colors.white,
                labelColor: Theme.of(context).disabledColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomElevatedButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionTwoWidget())),
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

  // void onPressed(BuildContext context) {
  //   return Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => QuestionTwoWidget()));
  // }
}
