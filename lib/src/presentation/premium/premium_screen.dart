import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/home/drawer_widget.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class PremiumScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).indicatorColor,
        title: Text(
          "GlobeDock +",
          style: TextStyle(color: Theme.of(context).cardColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openEndDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      backgroundColor: Theme.of(context).indicatorColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              Images.PREMIUM_ROCKET,
            )
          ]),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          INTRODUCING_PREMIUM,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          VIP_SERVICE,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          ONE_SOLUTION,
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
          child: CustomIconButton(
              onTap: () =>
                  GoRouter.of(context).go(AppRoutes.PREMIUM_PLAN_ROUTE_PATH),
              label: EXPLORE_PLANS,
              isIconLeading: false,
              color: Theme.of(context).scaffoldBackgroundColor,
              labelColor: Theme.of(context).dialogBackgroundColor,
              icon: SvgPicture.asset(
                CustomIcons.FORWARD_ARROW,
                color: Theme.of(context).dialogBackgroundColor,
              )),
        )
      ]),
    );
  }
}
