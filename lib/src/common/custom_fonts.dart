import 'package:flutter/material.dart';
import 'package:globedock/src/common/custom_font_size.dart';

class CustomFonts {
  static const String inter = 'Inter';

  static TextStyle _baseFont({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: inter,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  static TextStyle extraSmall({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: CustomFontSize.s10,
    );
  }

  static TextStyle small({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: CustomFontSize.s12,
    );
  }

  static TextStyle medium({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: CustomFontSize.s16,
    );
  }

  static TextStyle large({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return _baseFont(
      color: color,
      fontWeight: fontWeight,
      fontSize: CustomFontSize.s20,
    );
  }

  static TextStyle subtitleTextStyle(BuildContext context) {
    return CustomFonts.large().copyWith(
      fontWeight: FontWeight.w600,
      fontSize: CustomFontSize.s10,
      color: Theme.of(context).cardColor,
    );
  }

  static TextStyle subtitleTextStyle2(BuildContext context) {
    return CustomFonts.large().copyWith(
      fontWeight: FontWeight.w600,
      fontSize: CustomFontSize.s16,
      color: Theme.of(context).cardColor,
    );
  }
}
