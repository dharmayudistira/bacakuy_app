import 'package:get/get.dart';

import '../controllers/progress_literacy_controller.dart';

class ProgressLiteracyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressLiteracyController>(
      () => ProgressLiteracyController(),
    );
  }
}
