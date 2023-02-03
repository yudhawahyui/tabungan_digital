import 'package:get/get.dart';

import '../controllers/add_savings_controller.dart';

class AddSavingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSavingsController>(
      () => AddSavingsController(),
    );
  }
}
