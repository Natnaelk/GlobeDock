import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/page/home/fill_profile_details_screen.dart';
import 'package:globedock/src/presentation/page/home/upload_documents_screen.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "My profile and documents",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(Images.QUESTION_ONBOARDING)]),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MAIN_PADDING.w, right: MAIN_PADDING.w),
                child: Text(
                  'To start your University Applications your counselor needs your profile details & documents',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FillProfileDetilsScreen())),
                child: Container(
                  margin: EdgeInsets.only(
                      left: MAIN_PADDING.w * 1.5, right: MAIN_PADDING.w * 1.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(RADIUS),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(SMALL_PADDING),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FillProfileDetilsScreen())),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fill Profile Details',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FillProfileDetilsScreen()));
                                    },
                                    icon: const Icon(Icons.chevron_right))
                              ],
                            ),
                            const SizedBox(
                              height: SPACE10,
                            ),
                            StepProgressIndicator(
                              totalSteps: 100,
                              currentStep: 32,
                              size: 12,
                              padding: 0,
                              selectedColor: Theme.of(context).primaryColor,
                              unselectedColor:
                                  Theme.of(context).primaryColorLight,
                              roundedEdges: const Radius.circular(RADIUS),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: SPACE10,
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadDocumentsScreen()))),
                child: Container(
                  margin: EdgeInsets.only(
                      left: MAIN_PADDING.w * 1.5, right: MAIN_PADDING.w * 1.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(RADIUS),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(SMALL_PADDING),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upload Documents',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UploadDocumentsScreen()));
                                },
                                icon: const Icon(Icons.chevron_right))
                          ],
                        ),
                        const SizedBox(
                          height: SPACE10,
                        ),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 50,
                          size: 12,
                          padding: 0,
                          selectedColor: Theme.of(context).primaryColor,
                          unselectedColor: Theme.of(context).primaryColorLight,
                          roundedEdges: const Radius.circular(RADIUS),
                        ),
                        const SizedBox(
                          height: SPACE10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
