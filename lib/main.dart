import 'package:conduit/core/presentation/routes/app_routes.dart';
import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightThemeData,
      getPages: AppRoutes.routes,
      initialRoute: Routes.login,
    );
  }
}
