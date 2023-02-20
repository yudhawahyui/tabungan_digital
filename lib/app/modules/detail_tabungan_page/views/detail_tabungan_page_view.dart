import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/detail_tabungan_widget.dart';

import '../controllers/detail_tabungan_page_controller.dart';

class DetailTabunganPageView extends GetView<DetailTabunganPageController> {
  String docId;
  DetailTabunganPageView({
    Key? key,
    required this.docId,
  }) : super(key: key);
  // get parameter


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailTabunganWidget(
          docId: docId,
        ),
      ),
    );
  }
}
