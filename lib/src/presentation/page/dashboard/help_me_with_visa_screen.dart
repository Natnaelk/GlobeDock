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

class HelpMeWithVisaScreen extends StatelessWidget {
  const HelpMeWithVisaScreen({Key? key}) : super(key: key);

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
        title: Text("Help me with Visa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Row(
                children: [
                  Text(
                    'Guides',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SMALL_PADDING),
              child: SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: countries.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VideoTile(country: countries[index]),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Row(
                children: [
                  Text(
                    'Ebooks',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SMALL_PADDING),
              child: SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: countries.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VideoTile(country: countries[index]),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: MAIN_PADDING,
          bottom: MAIN_PADDING * 3,
          right: MAIN_PADDING,
          top: MAIN_PADDING,
        ),
        child: CustomIconButton(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => SafeArea(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Yet to be assigned',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'a Visa assistance expert will soon be assigned to you',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: SMALL_PADDING, right: SMALL_PADDING),
                            child: CustomElevatedButton(
                              onTap: () => Navigator.of(context).pop(),
                              label: 'Ok',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          color: Theme.of(context).primaryColor,
          label: 'Call Your Visa Expert',
          isIconLeading: true,
          labelColor: Colors.white,
          icon: SvgPicture.asset(CustomIcons.CALL),
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
            Text(
              'UK Visa Guide',
              style: TextStyle(
                  fontSize: CustomFontSize.s13,
                  color: Theme.of(context).dialogBackgroundColor),
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
