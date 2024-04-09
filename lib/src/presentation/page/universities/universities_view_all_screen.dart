import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/destination/tabs/universities_tab.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class UniversitiesViewAllScreen extends StatefulWidget {
  const UniversitiesViewAllScreen({Key? key}) : super(key: key);

  @override
  State<UniversitiesViewAllScreen> createState() =>
      _UniversitiesViewAllScreenState();
}

class _UniversitiesViewAllScreenState extends State<UniversitiesViewAllScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<Widget> _tabs = [
    UK(),
    US(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () =>
              GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        ),
        title: Text(
          'Search university',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          physics: const ClampingScrollPhysics(),
          isScrollable: true,
          padding: EdgeInsets.zero,
          dividerHeight: 100,
          dividerColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: countries.map((title) => Tab(text: title.name)).toList(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: MAIN_PADDING,
                left: MAIN_PADDING * 1.1,
                right: MAIN_PADDING * 1.1,
                bottom: MAIN_PADDING * 7),
            child: SingleChildScrollView(child: _tabs[_selectedIndex]),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     color: Colors.white,
          //     padding: const EdgeInsets.only(
          //       left: MAIN_PADDING,
          //       bottom: MAIN_PADDING * 3,
          //       right: MAIN_PADDING,
          //       top: MAIN_PADDING,
          //     ),
          //     child: CustomIconButton(
          //       onTap: () {},
          //       color: Theme.of(context).primaryColor,
          //       label: 'Save and Next',
          //       isIconLeading: false,
          //       labelColor: Colors.white,
          //       icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class UK extends StatelessWidget {
  const UK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: MAIN_PADDING),
          child: Column(
            children: [
              UniversitiesCard(
                title: 'De montfort University International',
                headerOne: 'Lecister, United Kingdom',
                headerTwo: 'Public | Estd. 1989 | 20+ courses',
              )
            ],
          ),
        );
      }),
    );
  }
}

class US extends StatelessWidget {
  const US({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
