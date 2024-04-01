import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xF2F2F2F2);
  static const Color primaryTextColor = Color(0xFF627282);
  static const Color darkTextColor = Color(0xFF3C3E41);

  static Color inputBackgroundColor = const Color(0xFFCCD6E0).withOpacity(0.2);
  static const Color primaryColor = Color(0xFF1980C4);

  static const String fontFamilyName = 'OpenSans';

  static const TextTheme textTheme = TextTheme(
    displayLarge: h1,
    titleLarge: h1,
    titleMedium: subtitle,
    bodySmall: caption,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w800,
    fontSize: 30,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 25,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    letterSpacing: 0,
    color: primaryTextColor, // was lightText
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle inputValue = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w500,
    fontSize: 21,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle commonText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 19,
    letterSpacing: 0,
    color: darkTextColor,
  );
}
