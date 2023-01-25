import 'package:get/get.dart';

import '../controllers/wellcome_page_2_controller.dart';

class WellcomePage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellcomePage2Controller>(
      () => WellcomePage2Controller(),
    );
  }
}
