import 'package:bacakuy_app/app/controllers/setting_preference_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SettingPreferenceController());
  }
}
