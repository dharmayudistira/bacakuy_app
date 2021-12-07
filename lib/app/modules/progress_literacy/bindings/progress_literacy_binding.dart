import 'package:get/get.dart';

import '../controllers/progress_literacy_controller.dart';

class ProgressLiterasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressLiterasiController>(
      () => ProgressLiterasiController(),
    );
  }
}
