import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tercapai_page_controller.dart';

class TercapaiPageView extends GetView<TercapaiPageController> {
  const TercapaiPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TercapaiPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TercapaiPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
