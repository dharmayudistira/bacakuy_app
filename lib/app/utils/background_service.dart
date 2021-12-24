import 'dart:isolate';
import 'dart:ui';
import 'package:bacakuy_app/app/utils/notification_helper.dart';
import 'package:bacakuy_app/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _service;
  static final String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _service = this;
  }

  factory BackgroundService() => _service ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {

    print('Notification Fired!');
    final NotificationHelper _helper = NotificationHelper();
    await _helper.showNotification(
      flutterLocalNotificationsPlugin,
    "Hai, yuk buka BacakuyApp",
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}