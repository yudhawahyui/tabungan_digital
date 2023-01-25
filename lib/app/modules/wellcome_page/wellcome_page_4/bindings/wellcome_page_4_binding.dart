import 'package:get/get.dart';

import '../controllers/wellcome_page_4_controller.dart';

class WellcomePage4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellcomePage4Controller>(
      () => WellcomePage4Controller(),
    );
  }
}
