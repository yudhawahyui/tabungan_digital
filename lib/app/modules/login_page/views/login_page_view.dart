import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/widget/login_page_widget/login_page.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: loginPage(),
      ),
    );
  }
}
