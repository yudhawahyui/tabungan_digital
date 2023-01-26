import 'package:get/get.dart';

class WellcomePage2Controller extends GetxController {
  //TODO: Implement WellcomePage2Controller

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
    Get.toNamed('/wellcome-page-3');
  }

  previousPage() {
    Get.toNamed('/wellcome-page');
  }
}
