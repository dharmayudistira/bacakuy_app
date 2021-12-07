import 'package:get/get.dart';

import '../controllers/add_literacy_controller.dart';

class AddLiteracyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLiteracyController>(
      () => AddLiteracyController(),
    );
  }
}
