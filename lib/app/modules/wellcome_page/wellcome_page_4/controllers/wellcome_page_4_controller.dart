import 'package:get/get.dart';

class WellcomePage4Controller extends GetxController {
  //TODO: Implement WellcomePage4Controller

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;

  nextPage() {
    Get.toNamed('/wellcome-page');
  }

  previousPage() {
    Get.toNamed('/wellcome-page-3');
  }
}
