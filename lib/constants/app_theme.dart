import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xF2F2F2F2);
  static const Color primaryTextColor = Color(0xFF627282);

  static const String fontFamilyName = 'OpenSans';

  static const TextTheme textTheme = TextTheme(
    displayLarge: h1,
    titleLarge: title,
    titleMedium: subtitle,
    bodySmall: caption,
  );

  static const TextStyle h1 = TextStyle(
    // h4 -> display1
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: primaryTextColor,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w800,
    fontSize: 30,
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
}
