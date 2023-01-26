import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_tabungan_page_controller.dart';

class DetailTabunganPageView extends GetView<DetailTabunganPageController> {
  const DetailTabunganPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailTabunganPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailTabunganPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
