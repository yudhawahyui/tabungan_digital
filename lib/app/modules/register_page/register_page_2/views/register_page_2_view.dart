import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/widget/register_page_widget/register_page_widget.dart';

import '../controllers/register_page_2_controller.dart';

class RegisterPage2View extends GetView<RegisterPage2Controller> {
  const RegisterPage2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: registerPage2(),
      ),
    );
  }
}
