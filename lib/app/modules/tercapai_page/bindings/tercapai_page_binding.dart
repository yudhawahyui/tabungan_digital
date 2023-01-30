import 'package:get/get.dart';

import '../controllers/tercapai_page_controller.dart';

class TercapaiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TercapaiPageController>(
      () => TercapaiPageController(),
    );
  }
}
