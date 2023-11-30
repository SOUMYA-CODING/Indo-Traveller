import 'package:flutter/material.dart';
import 'package:frontend_app/utils/theme.dart';
import 'package:frontend_app/utils/strings.dart';
import 'package:frontend_app/routes/app_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
    );
  }
}
