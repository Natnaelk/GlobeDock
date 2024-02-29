import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:globedock/src/data/model/country.dart';

class HomeCountryTile extends StatelessWidget {
  final Country country;

  const HomeCountryTile({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
          Image.asset(
            country.image,
            width: 90.w,
            height: 70.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 12.h),
          Text(
            country.name,
            style: TextStyle(
                fontSize: CustomFontSize.s13,
                color: Theme.of(context).dialogBackgroundColor),
          ),
          SizedBox(height: 4.h),
          Text(
            '640+ Universities',
            style: TextStyle(
                fontSize: CustomFontSize.s12,
                color: Theme.of(context).disabledColor),
          ),
        ],
      ),
    );
  }
}
