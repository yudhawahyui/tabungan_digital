import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      body: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: () {
                    auth.logOut();
                  },
                  child: const Icon(UniconsLine.sign_out_alt),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryBg,
                  ),
                  onPressed: () {},
                  child: const Text('Target Nabung'),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: AppColors.black,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.black,
                  ),
                  onPressed: () {},
                  child: const Text('Target Selesai'),
                ),
              ],
            ),

            // TargetNabung(),
            // TargetSelesai()
          ],
        ),
      ),
    ));
  }
}
