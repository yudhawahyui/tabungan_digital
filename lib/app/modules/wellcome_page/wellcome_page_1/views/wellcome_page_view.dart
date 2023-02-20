import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/login_page/views/login_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/wellcome_page_widget/wellcome_page_widget.dart';
import 'package:intro_slider/intro_slider.dart';
import '../controllers/wellcome_page_controller.dart';

class WellcomePageView extends GetView<WellcomePageController> {
  const WellcomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ContentConfig> listContentConfig = [];

    listContentConfig.add(
      const ContentConfig(
        title: "Tabungan Digital",
        description:
            "Selamat datang di tabungan digital! mari nabung agar kekayaan makin tak terhitung!",
        pathImage: "assets/images/tabungan_digital_logo_big.png",
        backgroundColor: AppColors.primaryBg,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Tabungan Digital",
        description:
            "Ga ribet hitung hitung uang, cukup masukin uang ke tabungan digital, dan uang akan terhitung otomatis!",
        pathImage: "assets/images/tabungan_digital_logo_big.png",
        backgroundColor: AppColors.primaryBg,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Tabungan Digital",
        description:
            "Jangan ragu untuk mulai, karena tabungan digital akan membantu kamu untuk mengatur keuanganmu!",
        pathImage: "assets/images/tabungan_digital_logo_big.png",
        backgroundColor: AppColors.primaryBg,
      ),
    );

    void onDonePress() {
      Get.offAll(const LoginPageView());
    }

    Widget renderDoneBtn() {
      return const Text(
        'Mulai',
        style: TextStyle(color: AppColors.black),
      );
    }

    Widget renderSkipBtn() {
      return const Text(
        'Skip',
        style: TextStyle(color: AppColors.black),
      );
    }

    Widget renderNextBtn() {
      return const Text(
        'Next',
        style: TextStyle(color: AppColors.black),
      );
    }

    return context.isPhone
        ? IntroSlider(
            key: UniqueKey(),
            listContentConfig: listContentConfig,
            onDonePress: onDonePress,
            renderDoneBtn: renderDoneBtn(),
            renderSkipBtn: renderSkipBtn(),
            renderNextBtn: renderNextBtn(),
          )
        : const LoginPageView();
  }
}
