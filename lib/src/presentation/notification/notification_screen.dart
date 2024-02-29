import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/widget/custom_app_bar.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: 'Notifications',
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          padding:
              const EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
          child: CustomIconButton(
              onTap: () {},
              label: BACK_TO_HOME,
              color: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).cardColor,
              icon: SvgPicture.asset(CustomIcons.BACK_ARROW)),
        )
      ]),
    );
  }
}
