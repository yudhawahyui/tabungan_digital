import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_page_2_controller.dart';

class RegisterPage2View extends GetView<RegisterPage2Controller> {
  const RegisterPage2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage2View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegisterPage2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
