import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/page/successstories/success_stories_screen.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';

class SuccessStoriesOnboardingScreen extends StatelessWidget {
  const SuccessStoriesOnboardingScreen({Key? key}) : super(key: key);

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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(
                      selectedIndex: '4',
                    )),
          ),
        ),
        title: Text(
          "Success stories",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '25,000+ happy students studying at their dream university abroad',
                    style: TextStyle(fontSize: 17),
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Get end-to-end support from applications to visa and more',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).disabledColor),
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          SvgPicture.asset(Images.SUCCESS_STORIES),
          SizedBox(
            height: 130.h,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomIconButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuccessStoriesScreen()));
                },
                label: 'Browse Success Stories',
                color: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).cardColor,
                isIconLeading: false,
                icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/compressed_images.png'),
                Text(
                  '10,000+ monthly counsellings',
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).disabledColor),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
