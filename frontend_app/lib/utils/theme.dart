import 'package:flutter/material.dart';
import 'package:frontend_app/utils/color.dart';
import 'package:frontend_app/views/widgets/themes/appbar_theme.dart';
import 'package:frontend_app/views/widgets/themes/text_theme.dart';

class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    disabledColor: AppColor.grey,
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    textTheme: AppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppbarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    disabledColor: AppColor.grey,
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    textTheme: AppTextTheme.darkTextTheme,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppbarTheme.darkAppBarTheme,
  );
}