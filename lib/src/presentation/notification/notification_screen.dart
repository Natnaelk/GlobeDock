import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotificationEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).cardColor,
            title: const Text('Notifications'),
            actions: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RADIUS)),
                      context: context,
                      builder: (BuildContext context) {
                        return VieosFilterBottomSheet(() {
                          Navigator.of(context).pop();
                          setState(() {
                            isNotificationEmpty = true;
                          });
                        });
                      });
                },
                child: const Padding(
                  padding: EdgeInsetsDirectional.only(end: SMALL_PADDING),
                  child: Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                ),
              )
            ]),
        body: isNotificationEmpty
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
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigationScreen(
                                      selectedIndex: '0',
                                    )),
                          ),
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
                    NotificationWidget(),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
                    NotificationWidget(),
                    Divider(),
                  ],
                ),
              ));
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abel Posted a video',
              style: Theme.of(context).textTheme.headlineSmall,
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
        SizedBox(height: 10), // Add some spacing between the rows
        Divider(
          color: Theme.of(context).disabledColor,
          thickness: 1,
          indent: 85, // Adjust thickness as needed
        ),
      ],
    );
  }
}

Widget VieosFilterBottomSheet(VoidCallback onClearPressed) {
  bool switchValue = false;
  String _selectedValue;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
          padding: EdgeInsets.only(top: MAIN_PADDING, bottom: MAIN_PADDING),
          color: Theme.of(context).cardColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onClearPressed,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MAIN_PADDING, right: MAIN_PADDING),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clear All',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Divider(),
                SizedBox(height: 10.h),
                Padding(
                  padding:
                      EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
                  child: Text(
                    'Show past notification',
                    //  style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 5.h),
                Divider(),
                SizedBox(height: 5.h),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MAIN_PADDING, right: MAIN_PADDING),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mute notification',
                          // style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Switch.adaptive(
                          value:
                              switchValue, // Set the current value of the switch
                          onChanged: (newValue) {
                            setState(() {
                              switchValue =
                                  newValue; // Update the state variable when the switch is toggled
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ]));
    },
  );
}
