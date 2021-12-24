import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
    FlutterLocalNotificationsPlugin plugin,
  ) async {
    var initSettingsForAndroid = AndroidInitializationSettings('app_icon');
    var initSettingsForIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initSettings = InitializationSettings(
      android: initSettingsForAndroid,
      iOS: initSettingsForIOS,
    );

    await plugin.initialize(
      initSettings,
      onSelectNotification: (payload) async {
        selectNotificationSubject.add(payload ?? 'empty payload');
      },
    );
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin plugin,
    String messageTitle,
  ) async {
    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "bacakuy channel";

    var androidPlatformSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: DefaultStyleInformation(true, true),
    );

    var iOSPlatformSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformSpecifics,
      iOS: iOSPlatformSpecifics,
    );

    var titleNotification = "BacakuyApp";
    var appName = messageTitle;

    await plugin.show(
      0,
      titleNotification,
      appName,
      platformChannelSpecifics,
      payload: "payload",
    );
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      Get.toNamed(route);
    });
  }
}
