import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class ReadyToFlyScreen extends StatelessWidget {
  const ReadyToFlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen(
                            selectedIndex: '4',
                          )),
                )),
        title: Text("Ready to fly"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.all(SMALL_PADDING),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: countries.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SMALL_PADDING,
                        right: SMALL_PADDING,
                        bottom: MAIN_PADDING),
                    child: VideoTile(country: countries[index]),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  final Country country;

  const VideoTile({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250.h,
      width: 230.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: SMALL_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(RADIUS),
                  topRight: Radius.circular(RADIUS)),
              child: Image.asset(
                'assets/images/uk_pic.png',
                width: double.infinity,
                height: 130.h,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  Text(
                    'UK Visa Guide',
                    style: TextStyle(
                        fontSize: CustomFontSize.s13,
                        color: Theme.of(context).dialogBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 15.h),
                child: CustomIconButton(
                  onTap: () {},
                  label: 'Download',
                  color: Theme.of(context).cardColor,
                  labelColor: Theme.of(context).primaryColor,
                  icon: SvgPicture.asset(
                    CustomIcons.DOWNLOAD,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: 15,
                  borderColor: Theme.of(context).primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
