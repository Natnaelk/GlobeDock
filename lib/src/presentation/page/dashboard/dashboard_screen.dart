import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/page/home/drawer_widget.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isProfileCompleted = false;
    int currentStep = 3;
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleTextStyle:
            TextStyle(fontSize: CustomFontSize.s16, color: Colors.black),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('👋 Welcome, User')]),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        child: SvgPicture.asset(
          isProfileCompleted ? CustomIcons.CHAT : CustomIcons.CALL,
          width: 23.w,
          height: 23.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.PLANE,
                      color: Theme.of(context).primaryColor,
                      width: 28,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: StepProgressIndicator(
                          totalSteps: 5,
                          currentStep: currentStep,
                          size: 50,
                          selectedColor: Colors.black,
                          padding: 0,
                          unselectedColor: Colors.grey,
                          direction: Axis.horizontal,
                          customStep: (index, color, _) => color == Colors.black
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 25,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Container(
                                      height: 12,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 25,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    Container(
                                      height: 12,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SvgPicture.asset(
                        Images.PLANE,
                        color: Theme.of(context).disabledColor,
                        width: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SMALL_PADDING,
            ),
            Padding(
              padding: EdgeInsets.all(MAIN_PADDING),
              child: Column(children: [
                CustomIconButton(
                  onTap: () {},
                  // => GoRouter.of(context).goNamed(
                  //     AppRoutes.QUESTION_ROUTE_NAME,
                  //     queryParameters: {'questionNumber': '1'}),
                  label: 'Get University Admits in 14 Days',
                  color: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).cardColor,
                  icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
                  isIconLeading: false,
                  borderRadius: 8,
                  height: 40.h,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Complete onboarding to unlock dashboard',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 25,
                ),
                Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(Images.MATCH_WITH_TEAM)),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(Images.WORKING_ON_APPS)),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(Images.APPLICATIONS_MGMT)),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                  alwaysIncludeSemantics: true,
                  opacity: isProfileCompleted ? 1 : 0.3,
                  child: Image.asset(
                    Images.VISA_MGMT,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
    ;
  }
}
