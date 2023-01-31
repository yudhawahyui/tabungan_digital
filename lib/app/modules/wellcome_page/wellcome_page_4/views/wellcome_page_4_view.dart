import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/wellcome_page_widget/wellcome_page_widget.dart';

import '../controllers/wellcome_page_4_controller.dart';

class WellcomePage4View extends GetView<WellcomePage4Controller> {
  const WellcomePage4View({Key? key}) : super(key: key);
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
          child: wellcome4(),
        ),
      ),
    );
  }
}
