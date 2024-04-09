import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/common/icons.dart';
import 'package:globedock/src/common/images.dart';
import 'package:globedock/src/data/model/country.dart';
import 'package:globedock/src/presentation/widget/custom_icon_button.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: MAIN_PADDING),
            child: SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinationOverviewCardImages.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: MAIN_PADDING, right: MAIN_PADDING),
                    child: OverviewTile(
                      isCareeir: false,
                      showBody: true,
                      index: index,
                      country: Country(
                          image: destinationOverviewCardImages[index],
                          name: destinationOverviewCardText[index]),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
            child: Container(
                height: 220.h,
                width: double.infinity,
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
                  padding: EdgeInsets.only(
                      left: MAIN_PADDING,
                      right: MAIN_PADDING,
                      top: MAIN_PADDING),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          'Why Study in UK',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'The United Kingdom is home to some of the most premier educational institutes that have etched their name in both QS World University and Times Higher Education Rankings. With an array ob bachelor\'s and master\'s programs and a vibrant atmosphere, lakhs of international students prefer to go to the United kingdom to gain the best quality education',
                      maxLines: 6,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 15.h),
                        child: CustomIconButton(
                          onTap: () {},
                          label: 'Download Study in Uk Guide',
                          color: Theme.of(context).cardColor,
                          labelColor: Theme.of(context).primaryColor,
                          icon: SvgPicture.asset(
                            CustomIcons.DOWNLOAD,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: 15,
                          borderColor: Theme.of(context).primaryColor,
                        ))
                  ]),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Top Universities',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     children: [
          //       GridView.builder(
          //         padding: EdgeInsets.zero,
          //         physics: const BouncingScrollPhysics(),
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             childAspectRatio: 1,
          //             mainAxisSpacing: 14,
          //             crossAxisSpacing: 15),
          //         shrinkWrap: true,
          //         itemCount: countries.length,
          //         scrollDirection: Axis.vertical,
          //         itemBuilder: (context, index) {
          //           return GridTile(
          //             child: SizedBox(
          //                 height: 50.h,
          //                 child: OverviewTile(
          //                   isCareeir: false,
          //                   country: countries[index],
          //                   showBody: false,
          //                 )),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: CustomIconButton(
          //     onTap: () {},
          //     label: 'View all universities',
          //     color: Theme.of(context).bottomAppBarColor,
          //     labelColor: Theme.of(context).primaryColor,
          //     icon: SvgPicture.asset(
          //       CustomIcons.FORWARD_ARROW,
          //     ),
          //     isIconLeading: false,
          //     borderColor: Theme.of(context).primaryColor,
          //     borderRadius: RADIUS,
          //     iconColor: Theme.of(context).primaryColor,
          //   ),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // AdmissionRequirements(),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Top universities',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: data.length,
          //   itemBuilder: (context, index) {
          //     return Column(
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.only(
          //               left: MAIN_PADDING,
          //               right: MAIN_PADDING,
          //               top: MAIN_PADDING),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Theme.of(context).cardColor,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.2),
          //                   spreadRadius: 1,
          //                   blurRadius: 2,
          //                   offset: Offset(0, 2),
          //                 ),
          //               ],
          //               borderRadius: BorderRadius.circular(RADIUS_SMALL),
          //             ),
          //             child: ExpansionTile(
          //               title: Text(
          //                 data[index].question!,
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold),
          //               ),
          //               collapsedBackgroundColor: Theme.of(context).cardColor,
          //               childrenPadding: EdgeInsets.all(8.0),
          //               children: [
          //                 Text(
          //                   data[index].answer!,
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Post Admission Experience',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: ExpansionTile(
          //     title: Text(showMore ? 'Visa Options' : 'Student permit',
          //         style: TextStyle(
          //             fontSize: showMore ? 16 : 12,
          //             fontWeight: FontWeight.bold)),
          //     shape: Border.all(color: Theme.of(context).bottomAppBarColor),
          //     onExpansionChanged: (val) => setState(() => showMore = !val),
          //     backgroundColor: Theme.of(context).bottomAppBarColor,
          //     collapsedBackgroundColor: Theme.of(context).bottomAppBarColor,
          //     childrenPadding: EdgeInsets.all(8.0),
          //     children: [
          //       Container(
          //         padding: EdgeInsets.only(
          //           left: MAIN_PADDING,
          //           right: MAIN_PADDING,
          //         ),
          //         decoration: BoxDecoration(
          //           color: Theme.of(context).cardColor,
          //           borderRadius: BorderRadius.circular(RADIUS_SMALL),
          //         ),
          //         child: Column(
          //           children: [
          //             Row(children: [
          //               Column(
          //                 children: [
          //                   Image.asset(
          //                     Images.CURRENCY,
          //                     width: 30,
          //                     height: 40,
          //                   ),
          //                   Text(
          //                     'Euro 94',
          //                     style: TextStyle(fontSize: 12),
          //                   ),
          //                   Text(
          //                     'Cost',
          //                     style: TextStyle(
          //                         fontSize: 12,
          //                         color: Theme.of(context).disabledColor),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 width: 10.w,
          //               ),
          //               Column(
          //                 children: [
          //                   Image.asset(
          //                     Images.CURRENCY,
          //                     width: 30,
          //                     height: 40,
          //                   ),
          //                   Text(
          //                     'Euro 94',
          //                     style: TextStyle(fontSize: 12),
          //                   ),
          //                   Text(
          //                     'Cost',
          //                     style: TextStyle(
          //                         fontSize: 12,
          //                         color: Theme.of(context).disabledColor),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(
          //                 width: 10.w,
          //               ),
          //               Column(
          //                 children: [
          //                   Image.asset(
          //                     Images.CURRENCY,
          //                     width: 30,
          //                     height: 40,
          //                   ),
          //                   Text(
          //                     'Euro 94',
          //                     style: TextStyle(fontSize: 12),
          //                   ),
          //                   Text(
          //                     'Cost',
          //                     style: TextStyle(
          //                         fontSize: 12,
          //                         color: Theme.of(context).disabledColor),
          //                   ),
          //                 ],
          //               ),
          //             ])
          //           ],
          //         ),
          //       ),
          //       ExpansionTile(
          //         backgroundColor: Theme.of(context).cardColor,
          //         title: SizedBox(),
          //         initiallyExpanded: true,
          //         shape: Border.all(color: Theme.of(context).bottomAppBarColor),
          //         iconColor: Theme.of(context).bottomAppBarColor,
          //         children: [
          //           Column(
          //             children: [
          //               Text(
          //                 'This is a long description  ' * 5,
          //                 maxLines: isExpanded ? 10 : 1,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //               SizedBox(height: 8.0),
          //               GestureDetector(
          //                 onTap: () {
          //                   setState(() {
          //                     isExpanded = !isExpanded;
          //                   });
          //                 },
          //                 child: Padding(
          //                   padding: const EdgeInsets.only(right: 5, left: 5),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.end,
          //                     children: [
          //                       Text(
          //                         'Read more',
          //                         style: TextStyle(
          //                             color: Theme.of(context).primaryColor,
          //                             fontSize: 13),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 10.h,
          //               ),
          //               CustomIconButton(
          //                   onTap: () {
          //                     showModalBottomSheet<void>(
          //                       context: context,
          //                       builder: (BuildContext context) => SafeArea(
          //                         child: SizedBox(
          //                           height: 240,
          //                           child: Column(
          //                             children: <Widget>[
          //                               SizedBox(
          //                                 height: 30.h,
          //                               ),
          //                               Padding(
          //                                 padding: const EdgeInsets.all(15.0),
          //                                 child: Row(children: [
          //                                   Text('Short-term study')
          //                                 ]),
          //                               ),
          //                               SizedBox(
          //                                 height: 5.h,
          //                               ),
          //                               Divider(),
          //                               Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: Text(
          //                                     '  This is a long description' *
          //                                         5),
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                   label: 'Know More',
          //                   isIconLeading: false,
          //                   borderRadius: 5,
          //                   color: Theme.of(context).primaryColor,
          //                   labelColor: Theme.of(context).cardColor,
          //                   icon: SvgPicture.asset(CustomIcons.FORWARD_ARROW))
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 2.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: MAIN_PADDING, right: MAIN_PADDING, top: MAIN_PADDING),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).cardColor,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.2),
          //           spreadRadius: 1,
          //           blurRadius: 2,
          //           offset: Offset(0, 2),
          //         ),
          //       ],
          //       borderRadius: BorderRadius.circular(RADIUS_SMALL),
          //     ),
          //     child: ExpansionTile(
          //       title: Text(
          //         'Expenses & Cost of living',
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //       ),
          //       collapsedBackgroundColor: Theme.of(context).cardColor,
          //       childrenPadding: EdgeInsets.all(8.0),
          //       children: [
          //         Text(
          //           'data[index].answer!',
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 25.h,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Careers + Work Opportunities',
          //         style: Theme.of(context).textTheme.headlineSmall,
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: MAIN_PADDING),
          //   child: SizedBox(
          //     height: 125.h,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: countries.length,
          //       itemBuilder: ((context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(
          //               top: MAIN_PADDING, right: MAIN_PADDING),
          //           child: OverviewTile(
          //             isCareeir: true,
          //             showBody: false,
          //             country: Country(
          //                 image: destinationOverviewCardImages[index],
          //                 name: 'Management'),
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: MAIN_PADDING, right: MAIN_PADDING),
            child: Row(
              children: [
                Text(
                  'Other Destinations',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: MAIN_PADDING),
            child: SizedBox(
              height: 150.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: countries.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(SMALL_PADDING),
                          child: Image.asset(
                            'assets/images/uk_pic.png',
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              'Australia',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewTile extends StatelessWidget {
  final Country country;
  final bool showBody;
  final bool isCareeir;
  final int index;

  const OverviewTile({
    Key? key,
    required this.country,
    required this.showBody,
    required this.isCareeir,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 100.h,
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
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: CustomFontSize.s13,
                color: Theme.of(context).dialogBackgroundColor),
          ),
          SizedBox(height: 10.h),
          showBody
              ? Text(
                  destinationOverviewCardTextBody[index],
                  textAlign: TextAlign.center,
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
