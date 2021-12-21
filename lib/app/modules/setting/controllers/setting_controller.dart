import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:bacakuy_app/app/controllers/setting_preference_controller.dart';
import 'package:bacakuy_app/app/utils/background_service.dart';
import 'package:bacakuy_app/app/utils/date_time_helper.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  final _settingPref = Get.find<SettingPreferenceController>();

  var isReminderActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    isReminderActive.value = _settingPref.getReminderPreference();
  }

  void updateReminderState(bool state) async {
    _settingPref.setReminderPreference(state);
    isReminderActive.value = _settingPref.getReminderPreference();

    if(GetPlatform.isAndroid) {
      if (isReminderActive.value) {
        await AndroidAlarmManager.periodic(
          Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
      } else {
        await AndroidAlarmManager.cancel(1);
      }
    }else {
      Get.snackbar("Mohon maaf", "Fitur ini hanya tersedia di platform Android");
    }
  }
}
