import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:go_router/go_router.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

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
          title: const Text('Videos'),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RADIUS)),
                    context: context,
                    builder: (BuildContext context) {
                      return VieosFilterBottomSheet();
                    });
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: MAIN_PADDING),
                child: SvgPicture.asset(CustomIcons.FILTER),
              ),
            )
          ]),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(SMALL_PADDING),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: countries.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoTile(country: countries[index]),
                  );
                })),
          )
        ]),
      ),
    );
  }
}

class VideoTile extends StatelessWidget {
  final Country country;

  const VideoTile({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.h,
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
        borderRadius: BorderRadius.circular(RADIUS_SMALL),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: MAIN_PADDING,
            right: MAIN_PADDING,
            top: MAIN_PADDING,
            bottom: MAIN_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(RADIUS),
                  child: Image.asset(
                    Images.GLOBEDOCK_WORKERS,
                    width: double.infinity,
                    height: 130.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      CustomIcons.PLAY,
                      width: 32.h,
                      height: 32.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text(
              'Top 6 mind-blowing AI Tools To Use As A student | ChatGPT, Dualingo & Moe | GlobeDock',
              style: TextStyle(
                  fontSize: CustomFontSize.s13,
                  color: Theme.of(context).dialogBackgroundColor),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        Images.AVATAR_IMAGE,
                        height: 30.h,
                        width: 30.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'GlobeDock',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Container(
                  width: 35.h,
                  height: 20.h,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      '3:20',
                      style: TextStyle(
                          color: Theme.of(context).cardColor, fontSize: 15),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget VieosFilterBottomSheet() {
  String _selectedValue;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.only(
            left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING * 1.3),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: FormBuilder(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter by',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Divider(),
                    SizedBox(height: 10.h),
                    Row(children: [
                      Text(
                        'Speaker Type',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ]),
                    FormBuilderFilterChip(
                      name: 'speaker_chip',
                      spacing: MAIN_PADDING,
                      showCheckmark: false,
                      selectedColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).cardColor,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      runSpacing: SMALL_PADDING,
                      options: [
                        FormBuilderChipOption(value: 'GlobeDock'),
                        FormBuilderChipOption(value: 'Mentor'),
                        FormBuilderChipOption(value: 'Team GlobeDock'),
                      ],
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(children: [
                      Text(
                        'Topic',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ]),
                    FormBuilderFilterChip(
                      name: 'topic_chip',
                      disabledColor: Colors.white,
                      spacing: MAIN_PADDING * 2,
                      showCheckmark: false,
                      selectedColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).cardColor,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      runSpacing: SMALL_PADDING,
                      options: [
                        FormBuilderChipOption(value: 'GlobeDock'),
                        FormBuilderChipOption(value: 'Mentor'),
                        FormBuilderChipOption(value: 'Team GlobeDock'),
                      ],
                      onChanged: (value) {
                        setState(() {}); // To update the UI
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(children: [
                      Text(
                        'Country',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ]),
                    FormBuilderFilterChip(
                      name: 'country_chip',
                      disabledColor: Theme.of(context).disabledColor,
                      selectedColor: Theme.of(context).primaryColor,
                      spacing: MAIN_PADDING,
                      showCheckmark: false,
                      backgroundColor: Theme.of(context).cardColor,
                      runSpacing: SMALL_PADDING,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      options: [
                        FormBuilderChipOption(
                          value: 'GlobeDock',
                        ),
                        FormBuilderChipOption(value: 'Mentor'),
                        FormBuilderChipOption(value: 'Team GlobeDock'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        }); // To update the UI
                      },
                    ),
                    SizedBox(height: MAIN_PADDING * 7),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
