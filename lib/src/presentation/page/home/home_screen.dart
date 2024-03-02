import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/home/drawer_widget.dart';
import 'package:globedock/src/presentation/page/home/journey_progress_widget.dart';
import 'package:globedock/src/presentation/page/home/quick_actions_widget.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:globedock/src/presentation/widget/home_country_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleTextStyle:
            TextStyle(fontSize: CustomFontSize.s16, color: Colors.black),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('👋 User')]),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        child: SvgPicture.asset(
          CustomIcons.CALL,
          width: 23.w,
          height: 23.h,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          CustomIconButton(
            onTap: () {},
            // => GoRouter.of(context).goNamed(
            //     AppRoutes.QUESTION_ROUTE_NAME,
            //     queryParameters: {'questionNumber': '1'}),
            label: 'Get University Admits in 14 Days',
            color: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).cardColor,
            icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW),
            isIconLeading: false,
            borderRadius: 0,
            height: 32.h,
          ),
          Container(
            color: Theme.of(context).bottomAppBarColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: MAIN_PADDING,
                      right: MAIN_PADDING,
                      top: MAIN_PADDING),
                  child: Column(
                    children: [
                      JourneyProgressWidget(),
                      SizedBox(
                        height: 15.h,
                      ),
                      QuickActionsWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  Images.GLOBEDOCK_IMAGE,
                  width: double.infinity,
                  fit: BoxFit.scaleDown,
                  scale: 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: MAIN_PADDING,
                      right: MAIN_PADDING,
                      top: MAIN_PADDING),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Destination',
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: MAIN_PADDING,
                      right: MAIN_PADDING,
                      top: MAIN_PADDING,
                      bottom: MAIN_PADDING * 2),
                  child: SizedBox(
                    height: 170.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: countries.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeCountryTile(country: countries[index]),
                          );
                        })),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
