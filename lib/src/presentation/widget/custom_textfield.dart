import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.width, required this.height})
      : super(key: key);
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width!.w,
      height: height!.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RADIUS),
        border: Border.all(color: Theme.of(context).canvasColor),
      ),
      child: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
