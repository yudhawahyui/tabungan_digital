import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/wellcome_page_widget/wellcome_page_widget.dart';

import '../controllers/wellcome_page_3_controller.dart';

class WellcomePage3View extends GetView<WellcomePage3Controller> {
  const WellcomePage3View({Key? key}) : super(key: key);
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
      child: const Scaffold(
        backgroundColor: AppColors.primaryBg,
        body: SafeArea(
          child: wellcome3(),
        ),
      ),
    );
  }
}
