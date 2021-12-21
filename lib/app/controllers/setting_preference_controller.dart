import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingPreferenceController extends GetxController {
  late GetStorage prefManager;

  @override
  void onInit() {
    super.onInit();
    prefManager = GetStorage();
  }

  void setReminderPreference(bool state) {
    prefManager.write("key_reminder", state);
  }

  bool getReminderPreference() {
    return prefManager.read("key_reminder") ?? false;
  }
}
