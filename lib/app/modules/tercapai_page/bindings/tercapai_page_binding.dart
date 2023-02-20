import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/tercapai_page/controllers/tercapai_page_controller.dart';

class TercapaiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TercapaiController>(
      () => TercapaiController(),
    );
  }
}
