import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/widget/custom_app_bar.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';

class NotificationScreen extends StatelessWidget {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        appBar: CustomAppBar(
          isBackButtonExist: false,
          title: 'Notifications',
        ),
        body: isEmpty
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Images.EMPTY_NOTIFICATION,
                        )
                      ]),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  NO_NOTIFICATION,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  THINGS_NEED_ATTENTION,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: MAIN_PADDING, right: MAIN_PADDING),
                  child: CustomIconButton(
                      onTap: () {},
                      label: BACK_TO_HOME,
                      color: Theme.of(context).primaryColor,
                      labelColor: Theme.of(context).cardColor,
                      icon: SvgPicture.asset(CustomIcons.BACK_ARROW)),
                )
              ])
            : Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: CustomImage(
                                height: 55.h,
                                width: 55.h,
                                fit: BoxFit.cover,
                                image: 'hello',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abel Posted a video',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Word of the day',
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: CustomFontSize.s13,
                                ),
                              ),
                              Text(
                                '5-Aug 3:17 PM',
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: CustomFontSize.s10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Add some spacing between the rows
                    Divider(
                      color: Theme.of(context).disabledColor,
                      thickness: 1,
                      indent: 85, // Adjust thickness as needed
                    ),
                  ],
                ),
              ));
  }
}
