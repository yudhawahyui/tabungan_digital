import 'package:get/get.dart';

import '../controllers/wellcome_page_3_controller.dart';

class WellcomePage3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellcomePage3Controller>(
      () => WellcomePage3Controller(),
    );
  }
}
