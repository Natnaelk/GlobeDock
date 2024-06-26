import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/images.dart';

class UniversitiesTab extends StatelessWidget {
  const UniversitiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.h, right: 15.h),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
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
            child: TextField(
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search_sharp,
                  size: 25,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          UniversitiesCard(
            title: 'Masters Marketing Management',
            headerOne: 'Lecister, United Kingdom',
            headerTwo: 'Fee: AUD 54302/Year | Destination: 1 Year',
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
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
            child: ListTile(
              leading: Image.asset(
                Images.CAPITAL,
                height: 200.h,
                width: 100,
              ),
              trailing: Icon(Icons.chevron_right),

              /// Image on the left
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masters Marketing Management',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ), // First text widget
                  Text(
                    'Lecister, United Kingdom',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).disabledColor),
                  ), // Second text widget
                  Text(
                    'Fee: AUD 3000/Year | Duration: 1 year',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).disabledColor),
                  ), // Third text widget
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UniversitiesCard extends StatelessWidget {
  const UniversitiesCard({
    Key? key,
    required this.title,
    required this.headerOne,
    required this.headerTwo,
  }) : super(key: key);

  final String title;
  final String headerOne;
  final String headerTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        leading: Image.asset(
          Images.CAPITAL,
          height: 300.h,
          width: 100,
        ),
        trailing: Icon(Icons.chevron_right),

        /// Image on the left
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)), // First text widget
            Text(
              headerOne!,
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).disabledColor),
            ), // Second text widget
            Text(
              headerTwo!,
              style: TextStyle(
                  fontSize: 12,
                  //   color: Theme.of(context).disabledColor,
                  fontWeight: FontWeight.bold),
            ), // Third text widget
          ],
        ),
      ),
    );
  }
}
