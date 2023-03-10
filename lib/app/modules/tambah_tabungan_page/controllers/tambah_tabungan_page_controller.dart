import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahTabunganPageController extends GetxController {
  //TODO: Implement TambahTabunganPageController

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
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

  void increment() => count.value++;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    print(selectedImagePath.value);
  }
}
