import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_tabungan_page_controller.dart';

class TambahTabunganPageView extends GetView<TambahTabunganPageController> {
  const TambahTabunganPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahTabunganPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahTabunganPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
