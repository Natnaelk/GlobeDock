import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';

class SuccessStoriesScreen extends StatelessWidget {
  const SuccessStoriesScreen({Key? key}) : super(key: key);

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
                )),
        title: Text(
          "Success Stories",
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
            left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
        child: Column(
          children: [
            SuccessStoryCard(
                newColor: Theme.of(context).cardColor,
                name: 'Abel Belay',
                image: '',
                nameColor: Theme.of(context).dialogBackgroundColor,
                iconColor: Theme.of(context).dialogBackgroundColor),
            SizedBox(
              height: MAIN_PADDING,
            ),
            SuccessStoryCard(
                newColor: Theme.of(context).cardColor,
                name: 'Abel Belay',
                image: '',
                nameColor: Theme.of(context).dialogBackgroundColor,
                iconColor: Theme.of(context).dialogBackgroundColor)
          ],
        ),
      )),
    );
  }
}

class SuccessStoryCard extends StatelessWidget {
  const SuccessStoryCard({
    Key? key,
    required this.newColor,
    required this.name,
    required this.image,
    required this.nameColor,
    required this.iconColor,
  }) : super(key: key);

  final Color newColor;
  final String name;

  final String image;

  final Color nameColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MAIN_PADDING, right: SMALL_PADDING, top: MAIN_PADDING),
        width: double.infinity,
        decoration: BoxDecoration(
          color: newColor,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: CustomImage(
                    height: 55.h,
                    width: 55.h,
                    fit: BoxFit.cover,
                    image: image,
                  ),
                ),
                // SizedBox(
                //   height: 48.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'See details',
                //       style: TextStyle(
                //           color: Theme.of(context).disabledColor,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 14),
                //     ),
                //   ],
                // )
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: nameColor,
                          fontSize: CustomFontSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Addis Ababa',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: CustomFontSize.s11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          CustomIcons.FORWARD_ARROW,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        'United States',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: CustomFontSize.s11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 15.w, right: 15.w, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 230, 230),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1.5,
                        )),
                    child: Text(
                      'Data Science',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: CustomFontSize.s10),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(Icons.chevron_right)),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ));
  }
}
