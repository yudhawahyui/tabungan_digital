import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/detail_tabungan_widget.dart';
import 'package:unicons/unicons.dart';

import '../controllers/detail_tabungan_page_controller.dart';

class DetailTabunganPageView extends GetView<DetailTabunganPageController> {
  const DetailTabunganPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DetailTabunganWidget(),
      ),
    );
  }
}
