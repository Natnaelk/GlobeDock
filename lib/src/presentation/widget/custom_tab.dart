import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/common/custom_font_size.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.haveBorderColor})
      : super(key: key);

  final String text;
  final bool isSelected;
  final bool haveBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(RADIUS),
      ),
      child: Tab(
        child: Text(
          text,
          style: TextStyle(
              fontSize: CustomFontSize.s14,
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).dialogBackgroundColor),
        ),
      ),
    );
  }
}
