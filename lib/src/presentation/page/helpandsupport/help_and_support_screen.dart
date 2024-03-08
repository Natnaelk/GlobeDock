import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:go_router/go_router.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).dialogBackgroundColor,
          ),
          onPressed: () =>
              GoRouter.of(context).go(AppRoutes.DASHBOARD_ROUTE_PATH),
        ),
        actions: [
          InkWell(
            onTap: () {
              // showModalBottomSheet(
              //     isScrollControlled: true,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(RADIUS)),
              //     context: context,
              //     builder: (BuildContext context) {
              //       return PremiumPlanInfoBottomSheet(context);
              //     });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: MAIN_PADDING),
              child: SvgPicture.asset(
                CustomIcons.CALL,
                color: Theme.of(context).dialogBackgroundColor,
              ),
            ),
          )
        ],
        title: Text(
          "Help & Support",
          style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Expenses & Cost of living',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  shape: Border.all(
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                  collapsedBackgroundColor: Theme.of(context).cardColor,
                  clipBehavior: Clip.antiAlias,
                  childrenPadding: EdgeInsets.all(8.0),
                  children: [
                    Text(
                      'Expenses & Cost of living' * 5,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
