import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';

class VisaMgmtScreen extends StatelessWidget {
  const VisaMgmtScreen({Key? key}) : super(key: key);

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
                            selectedIndex: '2',
                          )),
                )),
        title: Text(
          "Visa Management",
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
            left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
        child: Column(
          children: [
            UniversityMgmtCard(
                newColor: Theme.of(context).cardColor,
                name: 'United States',
                image: '',
                nameColor: Theme.of(context).dialogBackgroundColor,
                iconColor: Theme.of(context).dialogBackgroundColor),
            SizedBox(
              height: MAIN_PADDING,
            ),
            UniversityMgmtCard(
                newColor: Theme.of(context).cardColor,
                name: 'Queen Mary',
                image: '',
                nameColor: Theme.of(context).dialogBackgroundColor,
                iconColor: Theme.of(context).dialogBackgroundColor)
          ],
        ),
      )),
    );
  }
}

class UniversityMgmtCard extends StatelessWidget {
  const UniversityMgmtCard({
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
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'See details',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                )
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
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Applied Mathematics and Robotics',
                        style: TextStyle(
                          color: nameColor,
                          fontSize: CustomFontSize.s13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intake: Sep 21',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: CustomFontSize.s13,
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
                          color: Colors.transparent,
                          width: 1.5,
                        )),
                    child: Text(
                      'Documents Awaited',
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: CustomFontSize.s10),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
