import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/question/question_four_screen.dart';
import 'package:globedock/src/presentation/page/question/question_two_screen.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';

class QuestionThreeScreen extends StatelessWidget {
  QuestionThreeScreen({Key? key, this.onTap}) : super(key: key);
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).dialogBackgroundColor,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionTwoWidget())),
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
              children: [SvgPicture.asset(Images.PLAN)]),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'When do you plan to start your studies aborad?',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MAIN_PADDING.w, right: MAIN_PADDING.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomElevatedButton(
                  onTap: () => onPressed(context),
                  label: 'Jan 2024',
                  color: Theme.of(context).cardColor,
                  labelColor: Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomElevatedButton(
                  onTap: () => onPressed(context),
                  label: 'Feb 2024',
                  color: Colors.white,
                  labelColor: Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomElevatedButton(
                  onTap: () => onPressed(context),
                  label: 'Mar 2024',
                  color: Theme.of(context).cardColor,
                  labelColor: Theme.of(context).disabledColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomElevatedButton(
                  onTap: () => onPressed(context),
                  label: 'Apr 2024',
                  color: Theme.of(context).cardColor,
                  labelColor: Theme.of(context).disabledColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  onPressed(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuestionFourScreen()));
  }
}
