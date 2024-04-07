import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/chat/chat_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/help_me_with_visa_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/my_profile_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/ready_to_fly_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/university_application_mgmt_screen.dart';
import 'package:globedock/src/presentation/page/dashboard/visa_mgmt_screen.dart';
import 'package:globedock/src/presentation/page/destination/tabs/faq_tab.dart';
import 'package:globedock/src/presentation/page/home/drawer_widget.dart';
import 'package:globedock/src/presentation/page/universities/universities_detail_screen.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    ServiceOne(),
    ServiceTwo(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isProfileCompleted = true;
    int currentStep = 3;
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleTextStyle:
            TextStyle(fontSize: CustomFontSize.s16, color: Colors.black),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('👋 Welcome, User')]),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatOnboardingScreen())),
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        child: SvgPicture.asset(
          isProfileCompleted ? CustomIcons.CHAT : CustomIcons.CALL,
          width: 23.w,
          height: 23.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.PLANE,
                      color: Theme.of(context).primaryColor,
                      width: 28,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Theme.of(context).cardColor,
                        child: StepProgressIndicator(
                          totalSteps: 5,
                          currentStep: currentStep,
                          size: 50,
                          selectedColor:
                              Theme.of(context).dialogBackgroundColor,
                          padding: 0,
                          unselectedColor: Colors.grey,
                          direction: Axis.horizontal,
                          customStep: (index, color, _) => color == Colors.black
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 25,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Container(
                                      height: 12,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 25,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    Container(
                                      height: 12,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).disabledColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SvgPicture.asset(
                        Images.PLANE,
                        color: Theme.of(context).disabledColor,
                        width: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MAIN_PADDING),
              child: Column(children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatOnboardingScreen())),
                  child: Opacity(
                      alwaysIncludeSemantics: true,
                      opacity: isProfileCompleted ? 1 : 0.3,
                      child: Image.asset(Images.MATCH_WITH_TEAM)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen())),
                  child: Opacity(
                      alwaysIncludeSemantics: true,
                      opacity: isProfileCompleted ? 1 : 0.3,
                      child: Image.asset(Images.WORKING_ON_APPS)),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomIconButton(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RADIUS)),
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  padding: EdgeInsets.only(
                                      top: MAIN_PADDING, bottom: MAIN_PADDING),
                                  color: Theme.of(context).cardColor,
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TabBar(
                                            tabAlignment: TabAlignment.fill,
                                            controller: _tabController,
                                            indicatorSize:
                                                TabBarIndicatorSize.tab,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            dividerColor: Colors.transparent,
                                            labelStyle: TextStyle(fontSize: 15),
                                            onTap: (index) {
                                              setState(() {
                                                _selectedIndex = index;
                                              });
                                            },
                                            tabs: ['Service One', 'Service Two']
                                                .map(
                                                    (title) => Tab(text: title))
                                                .toList(),
                                          ),
                                          _tabs[_selectedIndex],
                                        ]),
                                  ));
                            },
                          );
                        });
                  },
                  label: 'Get University Admits in 14 Days',
                  color: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).cardColor,
                  icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
                  isIconLeading: false,
                  borderRadius: 8,
                  height: 30.h,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Complete onboarding to unlock the below features',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UniversityApplicationMgmtScreen())),
                  child: Opacity(
                      alwaysIncludeSemantics: true,
                      opacity: isProfileCompleted ? 1 : 0.3,
                      child: Image.asset(Images.APPLICATIONS_MGMT)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VisaMgmtScreen())),
                  child: Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(
                      Images.VISA_MGMT,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpMeWithVisaScreen())),
                  child: Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(
                      Images.HELP_ME_WITH_VISA,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReadyToFlyScreen())),
                  child: Opacity(
                    alwaysIncludeSemantics: true,
                    opacity: isProfileCompleted ? 1 : 0.3,
                    child: Image.asset(
                      Images.READY_TO_FLY,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
    ;
  }
}

class ServiceOne extends StatefulWidget {
  const ServiceOne({Key? key}) : super(key: key);

  @override
  State<ServiceOne> createState() => _ServiceOneState();
}

class _ServiceOneState extends State<ServiceOne> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ServiceTwo extends StatefulWidget {
  const ServiceTwo({Key? key}) : super(key: key);

  @override
  State<ServiceTwo> createState() => _ServiceTwoState();
}

class _ServiceTwoState extends State<ServiceTwo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
