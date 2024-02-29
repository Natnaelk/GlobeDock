import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/presentation/page/question/question_four_screen.dart';
import 'package:globedock/src/presentation/page/question/question_one_screen.dart';
import 'package:globedock/src/presentation/page/question/question_three_screen.dart';
import 'package:globedock/src/presentation/page/question/question_two_screen.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key, required this.questionNumber}) : super(key: key);

  String? questionNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: SingleChildScrollView(
            child: Column(children: [
          questionNumber == '1'
              ? QuestionOneWidget()
              : questionNumber == '2'
                  ? QuestionTwoWidget()
                  : questionNumber == '3'
                      ? QuestionThreeScreen()
                      : questionNumber == '4'
                          ? QuestionFourScreen()
                          : SizedBox()
        ])),
      ),
    );
  }
}
