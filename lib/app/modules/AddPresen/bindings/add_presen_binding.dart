import 'package:get/get.dart';

import '../controllers/add_presen_controller.dart';

class AddPresenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPresenController>(
      () => AddPresenController(),
    );
  }
}
