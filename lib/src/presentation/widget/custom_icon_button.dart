import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {required this.onTap,
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
      this.isIconLeading = true,
      this.isContentCentered = false,
      this.borderRadius = RADIUS_SMALL,
      this.iconColor,
      this.showBorder = true,
      this.textSize = 16,
      this.alignIconOnStart = false});

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
  final bool isIconLeading;
  final bool isContentCentered;
  final double borderRadius;
  final Color? iconColor;
  final bool showBorder;
  final double textSize;
  final bool alignIconOnStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                  color: showBorder ? borderColor! : Colors.transparent)),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIconLeading
                  ? alignIconOnStart
                      ? Padding(
                          padding: EdgeInsets.only(left: MAIN_PADDING.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              icon!,
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: MAIN_PADDING.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        label!,
                                        style: TextStyle(
                                          color: labelColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon!,
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              label!,
                              style: TextStyle(
                                color: labelColor,
                              ),
                            )
                          ],
                        )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          label!,
                          style:
                              TextStyle(color: labelColor, fontSize: textSize),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        icon!,
                      ],
                    )
            ],
          )),
    );
  }
}

class MobileLoginTab extends StatefulWidget {
  const MobileLoginTab({Key? key}) : super(key: key);

  @override
  State<MobileLoginTab> createState() => _MobileLoginTabState();
}

class _MobileLoginTabState extends State<MobileLoginTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
