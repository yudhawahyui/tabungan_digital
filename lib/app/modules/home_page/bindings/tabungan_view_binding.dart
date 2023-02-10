import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
// import 'package:tabungan_digital/app/modules/home_page/controllers/test_controller.dart';

class TabunganControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TestController>(TestController());
  }
}
