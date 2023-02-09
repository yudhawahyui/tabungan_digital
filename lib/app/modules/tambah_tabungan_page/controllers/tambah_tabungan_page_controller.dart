import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahTabunganPageController extends GetxController {
  final nameSavingController = TextEditingController();
  final targetSavingController = TextEditingController();
  final nominalSavingController = TextEditingController();
  final informationController = TextEditingController();
  final planSaving = "".obs;
  final imagePath = "".obs;
  final imageSize = "".obs;

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
    nameSavingController.dispose();
    targetSavingController.dispose();
    nominalSavingController.dispose();
    informationController.dispose();
    super.onClose();
  }

  void addSaving() {
    Map data = {
      "name_saving": nameSavingController.text,
      "target_saving": targetSavingController.text,
      "nominal_saving": nominalSavingController.text,
      "information": informationController.text,
      "plan_saving": planSaving.value,
      "image_path": imagePath.value,
    };
    print(data);
    nameSavingController.clear();
    targetSavingController.clear();
    nominalSavingController.clear();
    informationController.clear();
    imagePath.value = "";
    Get.snackbar("Tambah Tabungan", "Berhasil menambahkan tabungan baru");
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
    print(imagePath.value);
  }
}
