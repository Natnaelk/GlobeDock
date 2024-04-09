import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/page/home/tabs/address_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/education_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/extra_curricular_documents_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/family_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/personal_info_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/recommendations_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/test_score_tab.dart';
import 'package:globedock/src/presentation/page/home/tabs/work_experience_tab.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class FillProfileDetilsScreen extends StatefulWidget {
  const FillProfileDetilsScreen({Key? key}) : super(key: key);

  @override
  State<FillProfileDetilsScreen> createState() =>
      _FillProfileDetilsScreenState();
}

class _FillProfileDetilsScreenState extends State<FillProfileDetilsScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<Widget> _tabs = [
    PersonalInfoTab(),
    AddressTab(),
    EducationTab(),
    FamilyTab(),
    TestScoreTab(),
    // WorkExperience(),
    //  ExtraCurricularDocumentsTab(),
    //RecommendationsTab()
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
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () =>
              GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        ),
        title: const Text('Fill Profile Details'),
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          physics: const ClampingScrollPhysics(),
          isScrollable: true,
          padding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: fillProfileDetilsTabTitles
              .map((title) => Tab(text: title))
              .toList(),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: MAIN_PADDING,
                bottom: MAIN_PADDING,
                right: MAIN_PADDING,
                top: MAIN_PADDING,
              ),
              child: CustomIconButton(
                onTap: () {},
                color: Theme.of(context).primaryColor,
                label: 'Save and Next',
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
