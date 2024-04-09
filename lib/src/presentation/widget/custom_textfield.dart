import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globedock/src/common/constant.dart';
import 'package:globedock/src/presentation/widget/custom_text_form_field.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.width,
    required this.height,
    this.isWidget = false,
    this.childWidget,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.helperText,
    this.onChanged,
    this.maxLength,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.helperMaxLines,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.textInputType,
    this.minLength = 1,
    this.minline = 1,
  }) : super(key: key);
  final double? width;
  final double? height;
  final bool isWidget;
  final Widget? childWidget;
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int minLength;
  final int minline;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width!.w,
        height: height!.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RADIUS),
            border: isWidget
                ? Border.all(color: Theme.of(context).canvasColor)
                : null),
        child: isWidget
            ? childWidget
            : Padding(
                padding: const EdgeInsets.only(top: 3),
                child: CustomTextFormField(
                  labelText: labelText,
                ),
              ));
  }
}
