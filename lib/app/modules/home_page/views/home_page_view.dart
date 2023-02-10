import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/detail_tabungan_page/views/detail_tabungan_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetNabung_widget.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetSelesai_widget.dart';
import 'package:tabungan_digital/pages/auth.dart';
import 'package:unicons/unicons.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  String email;
  HomePageView({
    Key? key,
    required this.email,
  }) : super(key: key);
  final auth = Get.find<AuthController>();

  List<Tab> myTab = [
    const Tab(
      child: Text('Target Tabungan', style: TextStyle(color: AppColors.black)),
    ),
    const Tab(
      child: Text(
        'Target Selesai',
        style: TextStyle(color: AppColors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed('/tambah-tabungan-page');
            },
            foregroundColor: AppColors.black,
            backgroundColor: AppColors.white,
            label: const Text('Tambah Tabungan'),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.primaryBg,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            icon: const Icon(
              UniconsLine.plus,
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Container(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                top: 16,
                bottom: 16,
              ),
              width: Get.width * 1,
              color: AppColors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Tabungan Digital',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.black,
                        ),
                        onPressed: () {},
                        child: const Icon(UniconsLine.sign_out_alt),
                      )
                    ],
                  ),
                  TabBar(
                    indicatorColor: AppColors.primaryBg,
                    tabs: myTab,
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            height: Get.height * .74,
            child: TabBarView(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed('/detail-tabungan-page'),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const TargetNabung();
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const TargetSelesai();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
