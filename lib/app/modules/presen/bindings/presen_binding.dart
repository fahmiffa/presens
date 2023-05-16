import 'package:get/get.dart';

import '../controllers/presen_controller.dart';

class PresenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresenController>(
      () => PresenController(),
    );
  }
}
