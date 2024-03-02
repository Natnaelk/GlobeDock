import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/presentation/page/home/profile_widget.dart';

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
          Padding(
            padding: const EdgeInsets.only(
                top: MAIN_PADDING * 4, right: MAIN_PADDING, left: MAIN_PADDING),
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
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('Pending Task',
                style: Theme.of(context).textTheme.bodyMedium),
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
                  CustomIcons.NOTIFICATION,
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('Notifications',
                style: Theme.of(context).textTheme.bodyMedium),
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
                  CustomIcons.HELP_AND_SUPPORT,
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('Help & Support',
                style: Theme.of(context).textTheme.bodyMedium),
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
                  CustomIcons.RATING,
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('Rate the App',
                style: Theme.of(context).textTheme.bodyMedium),
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
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('Share the App',
                style: Theme.of(context).textTheme.bodyMedium),
            onTap: () {
              Navigator.pop(context);
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
                  height: 25,
                  width: 25,
                  color: Theme.of(context).dialogBackgroundColor,
                )),
            title: Text('View Success Stories',
                style: Theme.of(context).textTheme.bodyMedium),
            onTap: () {
              Navigator.pop(context);
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
