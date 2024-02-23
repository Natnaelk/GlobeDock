import 'package:globedock/src/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:globedock/src/common/custom_font_size.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    canvasColor: ColorLight.canvasColor,
    // ignore: deprecated_member_use
    backgroundColor: ColorLight.background,
    cardColor: ColorLight.card,
    disabledColor: ColorLight.disabledButton,
    // ignore: deprecated_member_use
    errorColor: ColorLight.error,
    hintColor: ColorLight.fontSubtitle,
    indicatorColor: ColorLight.primary,
    iconTheme: const IconThemeData(
      color: ColorLight.fontTitle,
    ),
    primaryColor: ColorLight.primary,
    primaryColorLight: ColorLight.primaryLight,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorLight.primary,
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(
        color: ColorLight.disabledButton,
      ),
    ),
    scaffoldBackgroundColor: ColorLight.card,
    dialogBackgroundColor: ColorLight.blackBackgroud,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      displayLarge: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: CustomFontSize.s17,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: CustomFontSize.s20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: CustomFontSize.s12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.rubik(
        color: ColorLight.fontTitle,
        fontSize: CustomFontSize.s16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.rubik(
        color: ColorLight.card,
        fontSize: CustomFontSize.s15,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: GoogleFonts.rubik(
        color: ColorLight.fontSubtitle,
        fontSize: CustomFontSize.s14,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.rubik(
        color: ColorLight.fontSubtitle,
        fontSize: CustomFontSize.s12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.rubik(
        color: Colors.white,
        fontSize: CustomFontSize.s14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

ThemeData themeDark(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    backgroundColor: ColorDark.fontSubtitle,
    cardColor: ColorDark.card,
    disabledColor: ColorDark.disabledButton,
    errorColor: ColorDark.error,
    // highlightColor: ColorDark.fontTitle,
    hintColor: ColorDark.fontSubtitle,
    indicatorColor: ColorLight.primary,
    iconTheme: const IconThemeData(
      color: ColorDark.fontTitle,
    ),
    primaryColor: ColorLight.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorLight.primary,
    ),
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide(
        color: ColorLight.disabledButton,
      ),
    ),
    scaffoldBackgroundColor: ColorDark.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
      displayLarge: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.rubik(
        color: ColorDark.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: GoogleFonts.rubik(
        color: ColorDark.fontSubtitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.rubik(
        color: ColorDark.fontSubtitle,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.rubik(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
