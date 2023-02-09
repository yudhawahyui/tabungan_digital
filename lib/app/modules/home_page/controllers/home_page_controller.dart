import 'package:get/get.dart';

class HomePageController extends GetxController {
  final tabIndex = 0.obs;

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

  void setTabIndex(index) {
    tabIndex.value = index as int;
  }
}
