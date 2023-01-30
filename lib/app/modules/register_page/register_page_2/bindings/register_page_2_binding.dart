import 'package:get/get.dart';

import '../controllers/register_page_2_controller.dart';

class RegisterPage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPage2Controller>(
      () => RegisterPage2Controller(),
    );
  }
}
