import 'package:flutter/material.dart';
import 'package:moedapp/src/constants/app_theme.dart';

InputDecoration inputFormDecorator({
  String? hintText,
  Widget? prefix,
  String? prefixText,
  Widget? prefixIcon,
  Widget? suffix,
  String? suffixText,
  Widget? suffixIcon,
  String? helperText,
}) {
  return InputDecoration(
    helperText: helperText,
    hintText: hintText,
    hintStyle: AppTheme.inputHint,
    prefix: prefix,
    prefixText: prefixText,
    prefixIcon: prefixIcon,
    prefixStyle: AppTheme.inputValue,
    suffix: suffix,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    suffixStyle: AppTheme.inputValue,
  );
}
