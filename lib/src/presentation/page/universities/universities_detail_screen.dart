import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/colors.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/common/routes.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/page/chat/chat_onboarding_screen.dart';
import 'package:globedock/src/presentation/page/destination/tabs/faq_tab.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class UniversitiesDetailScreen extends StatefulWidget {
  const UniversitiesDetailScreen({Key? key}) : super(key: key);

  @override
  State<UniversitiesDetailScreen> createState() =>
      _UniversitiesDetailScreenState();
}

class _UniversitiesDetailScreenState extends State<UniversitiesDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<Widget> _tabs = [
    OverviewTab(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.share(
              'Hi anyone up for masters in UK for January 2023 www.globedock.com');
        },
        isExtended: true,
        backgroundColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        child: Icon(
          Icons.share,
          color: Theme.of(context).cardColor,
          size: 23.h,
        ),
      ),
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
          "Queen Mary University of London",
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                Images.GLOBEDOCK_WORKERS,
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
                              Images.UNIVERSITY_PLACEHOLDER,
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
                              'Masters Marketing Management',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text('Lecister, United Kingdom',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColorLight.fontSubtitle)),
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
                      indicatorSize: TabBarIndicatorSize.tab,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      labelStyle: TextStyle(fontSize: 15),
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      tabs: universitiesTabs
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
          //       label: 'Talk to a UK Expert for FREE',
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

class OverviewTab extends StatefulWidget {
  OverviewTab({Key? key}) : super(key: key);

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  List<FAQModel> data = [];
  bool showMore = true;
  bool isExpanded = false;
  List dataList = [
    {
      "question": "Q1",
      "answer": "A1",
    },
    {
      "question": "Q2",
      "answer": "A2",
    },
    {
      "question": "Q3",
      "answer": "A3",
    },
    {
      "question": "Q4",
      "answer": "A4",
    },
  ];

  @override
  void initState() {
    dataList.forEach((element) {
      data.add(FAQModel.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
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
                          borderRadius: BorderRadius.circular(RADIUS),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13.0, top: 13, bottom: 13),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      Images.COURSES_ICON,
                                      width: 30.h,
                                      height: 25.h,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5+',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text('Courses',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColorLight.fontSubtitle)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Container(
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
                          borderRadius: BorderRadius.circular(RADIUS),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13.0, top: 13, bottom: 13),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Image.asset(
                                    Images.RANKING_ICON,
                                    width: 30.h,
                                    height: 25.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '50 - 100',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text('QS Ranking',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColorLight.fontSubtitle)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Get in Touch',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Container(
          //       height: 330.h,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).cardColor,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.2),
          //             spreadRadius: 1,
          //             blurRadius: 2,
          //             offset: Offset(0, 2),
          //           ),
          //         ],
          //         borderRadius: BorderRadius.circular(RADIUS),
          //       ),
          //       child: Padding(
          //         padding: EdgeInsets.only(
          //             left: MAIN_PADDING,
          //             right: MAIN_PADDING,
          //             top: MAIN_PADDING),
          //         child: Column(children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 decoration: BoxDecoration(
          //                     color: Theme.of(context).primaryColor,
          //                     shape: BoxShape.circle),
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(6.0),
          //                   child: Center(
          //                       child: SvgPicture.asset(CustomIcons.CALL)),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 20.w,
          //               ),
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 decoration: BoxDecoration(
          //                     color: Theme.of(context).primaryColor,
          //                     shape: BoxShape.circle),
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(6.0),
          //                   child: Center(
          //                       child: SvgPicture.asset(
          //                     CustomIcons.WEB,
          //                   )),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 20.w,
          //               ),
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 decoration: BoxDecoration(
          //                     color: Theme.of(context).primaryColor,
          //                     shape: BoxShape.circle),
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(6.0),
          //                   child: Column(
          //                     children: [
          //                       SvgPicture.asset(Images.EMAIL_LOGIN),
          //                     ],
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //           SizedBox(
          //             height: 3.h,
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                 'Phone',
          //                 style: TextStyle(
          //                     fontSize: 10,
          //                     color: Theme.of(context)
          //                         .textTheme
          //                         .titleSmall!
          //                         .color),
          //               ),
          //               SizedBox(
          //                 width: 18.w,
          //               ),
          //               Text(
          //                 'Website',
          //                 style: TextStyle(
          //                     fontSize: 10,
          //                     color: Theme.of(context)
          //                         .textTheme
          //                         .titleSmall!
          //                         .color),
          //               ),
          //               SizedBox(
          //                 width: 18.w,
          //               ),
          //               Text(
          //                 'Email',
          //                 style: TextStyle(
          //                     fontSize: 10,
          //                     color: Theme.of(context)
          //                         .textTheme
          //                         .titleSmall!
          //                         .color),
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 20.h,
          //           ),
          //           Image.asset(
          //             'assets/images/map.png',
          //             height: 300,
          //             width: double.infinity,
          //           )
          //         ]),
          //       )),
          // ),
          SizedBox(
            height: 10.h,
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           'Popular Courses',
          //           style: Theme.of(context).textTheme.headlineSmall,
          //         ),
          //         GestureDetector(
          //           onTap: () => GoRouter.of(context)
          //               .go(AppRoutes.UNIVERSITIES_ROUTE_PATH),
          //           child: Text(
          //             'View all',
          //             style: TextStyle(
          //                 color: Theme.of(context).primaryColor, fontSize: 15),
          //           ),
          //         )
          //       ]),
          // ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Column(
          //         children: [
          //           Image.asset(
          //             Images.UK_FLAG,
          //             width: 60.h,
          //             height: 60.h,
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         width: 15.w,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Masters Marketing Management',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           SizedBox(
          //             height: 3.h,
          //           ),
          //           Text('Lecister, United Kingdom',
          //               style: TextStyle(
          //                   fontSize: 13, color: ColorLight.fontSubtitle)),
          //           Text('Fee: GBP 9,995 | Duration: 15 Months',
          //               style: TextStyle(
          //                   fontSize: 13, color: ColorLight.fontSubtitle))
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Similar Universities',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Column(
          //         children: [
          //           Image.asset(
          //             Images.UK_FLAG,
          //             width: 60.h,
          //             height: 60.h,
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         width: 15.w,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Masters Marketing Management',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           SizedBox(
          //             height: 3.h,
          //           ),
          //           Text('Lecister, United Kingdom',
          //               style: TextStyle(
          //                   fontSize: 13, color: ColorLight.fontSubtitle)),
          //           Text('Privatej . | 10+ Courses',
          //               style: TextStyle(
          //                   fontSize: 13,
          //                   color: Theme.of(context).dialogBackgroundColor))
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class UniversitiesOverviewTile extends StatelessWidget {
  final Country country;
  final bool showBody;
  final bool isCareeir;

  const UniversitiesOverviewTile({
    Key? key,
    required this.country,
    required this.showBody,
    required this.isCareeir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
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
      child: Column(
        children: [
          SizedBox(height: showBody ? 0 : 10.h),
          Image.asset(
            country.image,
            width: 70.w,
            height: 50.h,
            fit: BoxFit.contain,
          ),
          showBody
              ? SizedBox(height: 5.h)
              : SizedBox(height: isCareeir ? 10.h : 32.h),
          Text(
            country.name,
            style: TextStyle(
                fontSize: CustomFontSize.s13,
                color: Theme.of(context).dialogBackgroundColor),
          ),
          SizedBox(height: 3.h),
          showBody
              ? Text(
                  '640+ Universities',
                  style: TextStyle(
                      fontSize: CustomFontSize.s12,
                      color: Theme.of(context).disabledColor),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class AdmissionRequirements extends StatelessWidget {
  const AdmissionRequirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
      child: Container(
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
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: MAIN_PADDING, left: SMALL_PADDING, right: SMALL_PADDING),
              child: Row(
                children: [
                  Text(
                    'Admission Reqirements',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: premiumPlansFeatures.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: MAIN_PADDING,
                      left: SMALL_PADDING,
                      right: SMALL_PADDING),
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          CustomIcons.CHECKED,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            premiumPlansFeatures[index],
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: CustomFontSize.s13,
                                color: Theme.of(context).dialogBackgroundColor),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}

class FAQModel {
  String? question;
  String? answer;

  FAQModel({this.question, this.answer});

  FAQModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }
}
