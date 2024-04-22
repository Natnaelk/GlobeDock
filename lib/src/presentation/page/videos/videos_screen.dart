import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/bottomNavigation/bottom_navigation_screen.dart';
import 'package:globedock/src/presentation/widget/custom_elevated_button.dart';

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
              onPressed: () => Navigator.pop(context)),
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
      height: 279.h,
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
  List<String> selectedChips = [];
  String _selectedValue;
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.all(MAIN_PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Text(
              'Speaker Type',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: SPACE10, // Adjust spacing between chips
                runSpacing: SPACE10, // Adjust spacing between rows
                children: [
                  for (var option in [
                    'GlobeDock',
                    'Mentor',
                    'GlobeDock Mentors',
                    'Team GlobeDock'
                  ])
                    FilterChip(
                      showCheckmark: false,
                      label: Text(option),
                      selected: selectedChips.contains(option),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedChips.add(option);
                          } else {
                            selectedChips.remove(option);
                          }
                        });
                      },
                      selectedColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).cardColor,
                      labelStyle: TextStyle(
                        color: selectedChips.contains(option)
                            ? Theme.of(context).cardColor
                            : Theme.of(context).textTheme.titleMedium!.color,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Topic',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: SPACE10, // Adjust spacing between chips
                runSpacing: SPACE10, // Adjust spacing between rows
                children: [
                  for (var option in [
                    'Student life',
                    'Study Abroad',
                    'Test prep',
                    'UK',
                    'USA',
                    'MBA'
                  ])
                    FilterChip(
                      showCheckmark: false,
                      label: Text(option),
                      selected: selectedChips.contains(option),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedChips.add(option);
                          } else {
                            selectedChips.remove(option);
                          }
                        });
                      },
                      selectedColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).cardColor,
                      labelStyle: TextStyle(
                        color: selectedChips.contains(option)
                            ? Theme.of(context).cardColor
                            : Theme.of(context).textTheme.titleMedium!.color,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Country',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 10.h),
            Container(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: SPACE10, // Adjust spacing between chips
                runSpacing: SPACE10, // Adjust spacing between rows
                children: [
                  for (var option in [
                    'International',
                    'Germany',
                    'Switzerland',
                    'UK',
                    'USA',
                    'MBA'
                  ])
                    FilterChip(
                      showCheckmark: false,
                      label: Text(option),
                      selected: selectedChips.contains(option),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedChips.add(option);
                          } else {
                            selectedChips.remove(option);
                          }
                        });
                      },
                      selectedColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).cardColor,
                      labelStyle: TextStyle(
                        color: selectedChips.contains(option)
                            ? Theme.of(context).cardColor
                            : Theme.of(context).textTheme.titleMedium!.color,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.4, // Adjust width as needed
                  child: CustomElevatedButton(
                    onTap: () {},
                    label: 'Apply',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
