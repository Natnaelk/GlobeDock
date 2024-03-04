import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/presentation/premium/tabs/elite_tab.dart';
import 'package:globedock/src/presentation/premium/tabs/executive_tab.dart';
import 'package:globedock/src/presentation/premium/tabs/premium_tab.dart';
import 'package:globedock/src/presentation/premium/tabs/supreme_tab.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class PremiumPlansScreen extends StatefulWidget {
  const PremiumPlansScreen({Key? key}) : super(key: key);

  @override
  State<PremiumPlansScreen> createState() => _PremiumPlansScreenState();
}

class _PremiumPlansScreenState extends State<PremiumPlansScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late TabController _tabController;

  final List<Widget> _tabs = [
    EliteTab(),
    PremiumTab(),
    ExecutiveTab(),
    SupremeTab()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).indicatorColor,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).cardColor,
            ),
            onPressed: () =>
                GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
          ),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RADIUS)),
                    context: context,
                    builder: (BuildContext context) {
                      return PremiumPlanInfoBottomSheet(context);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: SMALL_PADDING),
                child: SvgPicture.asset(CustomIcons.INFO),
              ),
            )
          ],
          title: Text(
            "GlobeDock +",
            style: TextStyle(color: Theme.of(context).cardColor),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColorLight,
            unselectedLabelColor: Theme.of(context).cardColor,
            controller: _tabController,
            padding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: premiumPlanTitles.map((title) => Tab(text: title)).toList(),
          ),
        ),
        backgroundColor: Theme.of(context).indicatorColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: MAIN_PADDING,
                  left: MAIN_PADDING,
                  right: MAIN_PADDING,
                  bottom: MAIN_PADDING * 7),
              child: SingleChildScrollView(child: _tabs[_selectedIndex]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.grey[900],
                padding: const EdgeInsets.only(
                  left: MAIN_PADDING,
                  bottom: MAIN_PADDING * 3,
                  right: MAIN_PADDING,
                  top: MAIN_PADDING,
                ),
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('7000ETB',
                                        style: TextStyle(
                                            color: Theme.of(context).cardColor,
                                            fontSize: CustomFontSize.s15,
                                            fontWeight: FontWeight.normal,
                                            decorationColor:
                                                Theme.of(context).cardColor,
                                            decoration:
                                                TextDecoration.lineThrough))
                                  ]),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '5000ETB',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )
                                  ])
                            ]),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {},
                          color: Theme.of(context).primaryColorLight,
                          label: 'Buy Now',
                          labelColor: Theme.of(context).dialogBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget PremiumPlanInfoBottomSheet(BuildContext context) {
  return Container(
    color: Colors.grey[900],
    height: 200.h,
    padding: EdgeInsets.all(MAIN_PADDING),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Yet to be assigned',
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: CustomFontSize.s15,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'If you are already enrolled with us, you can also connect with your counselled/coach to know more about the different pans.',
        style: TextStyle(
          color: Theme.of(context).cardColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 15.h,
      ),
      CustomIconButton(
          onTap: () => Navigator.of(context).pop(),
          label: 'Ok, got it',
          color: Theme.of(context).cardColor,
          labelColor: Theme.of(context).dialogBackgroundColor,
          isIconLeading: false,
          icon: SvgPicture.asset(
            CustomIcons.FORWARD_ARROW,
            color: Theme.of(context).dialogBackgroundColor,
          ))
    ]),
  );
}
