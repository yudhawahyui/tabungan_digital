import 'package:get/get.dart';

import '../controllers/tambah_tabungan_page_controller.dart';

class TambahTabunganPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahTabunganPageController>(
      () => TambahTabunganPageController(),
    );
  }
}
