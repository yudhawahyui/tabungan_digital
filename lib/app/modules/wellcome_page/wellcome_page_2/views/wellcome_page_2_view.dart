import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/login_page/views/login_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/wellcome_page_widget/wellcome_page_widget.dart';

import '../controllers/wellcome_page_2_controller.dart';

class WellcomePage2View extends GetView<WellcomePage2Controller> {
  const WellcomePage2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          controller.nextPage();
        } else if (details.primaryVelocity! > 0) {
          controller.previousPage();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: SafeArea(
          child: context.isPhone ? wellcome2() : LoginPageView(),
        ),
      ),
    );
  }
}
