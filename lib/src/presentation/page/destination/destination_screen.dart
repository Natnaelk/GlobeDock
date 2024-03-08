import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/destination/tabs/faq_tab.dart';
import 'package:globedock/src/presentation/page/destination/tabs/overview_tab.dart';
import 'package:globedock/src/presentation/page/destination/tabs/universities_tab.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen>
    with SingleTickerProviderStateMixin {
  @override
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<Widget> _tabs = [
    OverviewTab(),
    UniversitiesTab(),
    FAQTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
          ),
          onPressed: () =>
              GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        ),
        title: Text(
          "UK",
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                'assets/images/uk_pic.png',
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding:
                    EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              Images.UK_FLAG,
                              width: 60.h,
                              height: 60.h,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Study in UK',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text('641 Universities',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorLight.fontSubtitle)),
                            Text(
                              '496,570 International Students',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TabBar(
                      tabAlignment: TabAlignment.fill,
                      controller: _tabController,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      labelStyle: TextStyle(fontSize: 15),
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      tabs: destinationTabs
                          .map((title) => Tab(text: title))
                          .toList(),
                    ),
                  ],
                ),
              ),
              _tabs[_selectedIndex],
              SizedBox(
                height: 10 * MAIN_PADDING,
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: MAIN_PADDING,
                bottom: MAIN_PADDING * 3,
                right: MAIN_PADDING,
                top: MAIN_PADDING,
              ),
              child: CustomIconButton(
                onTap: () {},
                color: Theme.of(context).primaryColor,
                label: 'Talk to a UK Expert for FREE',
                isIconLeading: false,
                labelColor: Colors.white,
                icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
