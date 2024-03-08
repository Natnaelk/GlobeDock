import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/presentation/page/home/drawer_widget.dart';

class TodoScreen extends StatelessWidget {
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
            children: const [Text('👋 Welcome, User')]),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(children: [Text('Your todo list')]),
          ),
          Container(
            padding: const EdgeInsets.all(25.0),
            width: double.infinity,
            color: Theme.of(context).cardColor,
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      CustomIcons.CHECKED,
                      color: Theme.of(context).primaryColor,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create an account',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: CustomFontSize.s13,
                                color: Theme.of(context).dialogBackgroundColor),
                          ),
                          Text('step 1',
                              style: TextStyle(
                                  fontSize: CustomFontSize.s13,
                                  color: Theme.of(context).disabledColor))
                        ],
                      ),
                    ),
                    Text('1 days ago',
                        style: TextStyle(
                            fontSize: CustomFontSize.s13,
                            color: Theme.of(context).disabledColor))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      CustomIcons.CHECKED,
                      color: Theme.of(context).primaryColor,
                      width: 40,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create an account',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: CustomFontSize.s13,
                                color: Theme.of(context).dialogBackgroundColor),
                          ),
                          Text('step 2',
                              style: TextStyle(
                                  fontSize: CustomFontSize.s13,
                                  color: Theme.of(context).disabledColor))
                        ],
                      ),
                    ),
                    Text('2 days ago',
                        style: TextStyle(
                            fontSize: CustomFontSize.s13,
                            color: Theme.of(context).disabledColor))
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
