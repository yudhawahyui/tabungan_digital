import 'package:get/get.dart';

import '../controllers/wellcome_page_controller.dart';

class WellcomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellcomePageController>(
      () => WellcomePageController(),
    );
  }
}
