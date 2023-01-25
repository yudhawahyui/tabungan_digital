import 'package:get/get.dart';

class WellcomePage3Controller extends GetxController {
  //TODO: Implement WellcomePage3Controller

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
    Get.toNamed('/wellcome-page-4');
  }

  previousPage() {
    Get.toNamed('/wellcome-page-2');
  }
}
