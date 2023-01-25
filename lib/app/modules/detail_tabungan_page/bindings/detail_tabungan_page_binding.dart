import 'package:get/get.dart';

import '../controllers/detail_tabungan_page_controller.dart';

class DetailTabunganPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTabunganPageController>(
      () => DetailTabunganPageController(),
    );
  }
}
