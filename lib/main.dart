import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:bacakuy_app/app/constants/color_constants.dart';
import 'package:bacakuy_app/app/utils/background_service.dart';
import 'package:bacakuy_app/app/utils/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  final NotificationHelper _helper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (GetPlatform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _helper.initNotifications(flutterLocalNotificationsPlugin);

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
