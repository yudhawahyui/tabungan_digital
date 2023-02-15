import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final imagePath = "".obs;
  final imageSize = "".obs;
  final count = 0.obs;
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

  void increment() => count.value++;

  void setTabIndex(index) {
    tabIndex.value = index as int;
  }
}
