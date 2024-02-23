import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onTap,
    key,
    required this.label,
    this.labelLoading,
    required this.color,
    required this.labelColor,
    this.child,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 52,
    this.labelSize,
    this.margin,
    required this.icon,
    this.borderColor = Colors.black,
  });

  final Widget? child;
  final String? label;
  final String? labelLoading;
  final Color? color;
  final Color? labelColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final bool isLoading;
  final double width;
  final double height;
  final double? labelSize;
  final EdgeInsetsGeometry? margin;
  final SvgPicture? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(RADIUS_SMALL),
              border: Border.all(color: borderColor!)),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  icon!,
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    label!,
                    style: TextStyle(color: labelColor),
                  )
                ],
              )
            ],
          )),
    );
  }
}
