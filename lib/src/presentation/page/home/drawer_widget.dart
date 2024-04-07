import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/page/home/profile_widget.dart';
import 'package:globedock/src/presentation/page/successstories/success_stories_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/videos/videos_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    this.isPremium = false,
  }) : super(key: key);

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () => GoRouter.of(context).go(AppRoutes.PROFILE_ROUTE_PATH),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: MAIN_PADDING * 4,
                  right: MAIN_PADDING,
                  left: MAIN_PADDING),
              child: Container(
                height: 72.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(RADIUS)),
                child: Column(
                  children: [ProfileWidget()],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.TASK,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'Pending Task',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(
                          selectedIndex: '3',
                        )),
              );
            },
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.NOTIFICATION,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'Notifications',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(
                          selectedIndex: '1',
                        )),
              );
            },
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.HELP_AND_SUPPORT,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'Help & Support',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              GoRouter.of(context).go(AppRoutes.HELP_ROUTE_PATH);
            },
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.RATING,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'Rate the App',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.SHARE,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'Share the App',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Share.share(
                  'Interested in studying abroad? Check out the GlobeDock app');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Divider(
              color: Theme.of(context).dividerColor,
            ),
          ),
          ListTile(
            leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  CustomIcons.SUCCESS,
                  height: 20,
                  width: 20,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text(
              'View Success Stories',
              style: GoogleFonts.rubik(
                color: Theme.of(context).dialogBackgroundColor,
                fontSize: CustomFontSize.s13,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideosScreen()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Divider(
              color: Theme.of(context).dividerColor,
            ),
          ),
          SizedBox(
            height: 120.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Version 1.0.0 (Latest)',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
