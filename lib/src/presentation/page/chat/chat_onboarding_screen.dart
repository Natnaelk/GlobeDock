import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/common/toast.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_dialog.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:globedock/src/presentation/widget/custom_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatOnboardingScreen extends StatefulWidget {
  const ChatOnboardingScreen({Key? key}) : super(key: key);

  @override
  State<ChatOnboardingScreen> createState() => _ChatOnboardingScreenState();
}

class _ChatOnboardingScreenState extends State<ChatOnboardingScreen> {
  bool newManagerAssigned = false;
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromARGB(255, 249, 249, 249);
    Color newColor = color.withOpacity(1);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
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
          "Chat",
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
          left: MAIN_PADDING,
          right: MAIN_PADDING,
          top: MAIN_PADDING,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text('Relationship Manager',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            SizedBox(
              height: 30.h,
            ),
            RelationshipManagerCard(
              newColor: newColor,
              name: 'Solomon',
              phone: '987654321',
              image: '',
              iconColor: newManagerAssigned
                  ? Color.fromARGB(255, 220, 220, 220)
                  : Theme.of(context).disabledColor,
              nameColor: newManagerAssigned
                  ? Color.fromARGB(255, 220, 220, 220)
                  : Theme.of(context).disabledColor,
              onBottomSheetTapped: () {
                setState(() {
                  newManagerAssigned = true;
                  Navigator.of(context).pop();
                  showToast(
                      msg: 'A new relationship manager has been assigned',
                      backgroundColor: ColorLight.success);
                });
              },
            ),
            newManagerAssigned
                ? SizedBox(
                    height: 20.h,
                  )
                : SizedBox(),
            newManagerAssigned
                ? RelationshipManagerCard(
                    newColor: newColor,
                    name: 'Abel',
                    phone: '987654321',
                    image: '',
                    onBottomSheetTapped: () {},
                    iconColor: Theme.of(context).disabledColor,
                    nameColor: Theme.of(context).dialogBackgroundColor,
                  )
                : SizedBox()
          ],
        ),
      )),
    );
  }
}

class RelationshipManagerCard extends StatelessWidget {
  const RelationshipManagerCard({
    Key? key,
    required this.newColor,
    required this.name,
    required this.phone,
    required this.image,
    required this.onBottomSheetTapped,
    required this.nameColor,
    required this.iconColor,
  }) : super(key: key);

  final Color newColor;
  final String name;
  final String phone;
  final String image;
  final VoidCallback onBottomSheetTapped;
  final Color nameColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: MAIN_PADDING,
          right: SMALL_PADDING,
        ),
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
          children: [
            Column(
              children: [
                ClipOval(
                  child: CustomImage(
                    height: 55.h,
                    width: 55.h,
                    fit: BoxFit.cover,
                    image: image,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 25.w,
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
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) => SafeArea(
                                child: GestureDetector(
                                  onTap: onBottomSheetTapped,
                                  child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Change relationship manager')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.more_vert,
                            color: iconColor,
                          )),
                    ],
                  ),
                  SizedBox(height: 2.h, child: Divider()),
                  SizedBox(
                    height: 8.h,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => GoRouter.of(context)
                              .go(AppRoutes.CHAT_ROOM_ROUTE_PATH),
                          child: Row(
                            children: [
                              Text(
                                'Chat',
                                style: TextStyle(
                                    color: iconColor,
                                    fontSize: CustomFontSize.s12),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                CustomIcons.CHAT,
                                color: iconColor,
                                height: 12.h,
                                width: 12.h,
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          indent: 0,
                          endIndent: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            showCallDialog(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Call',
                                style: TextStyle(
                                    color: iconColor,
                                    fontSize: CustomFontSize.s12),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              SvgPicture.asset(
                                CustomIcons.CALL,
                                color: iconColor,
                                height: 12.h,
                                width: 12.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
