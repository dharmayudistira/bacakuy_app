import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/utils/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(_buildApp());
}

Widget _buildApp() {
  return GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    theme: ThemeData(
      textTheme: myTextTheme,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: kPrimaryColor,
    ),
  );
}
