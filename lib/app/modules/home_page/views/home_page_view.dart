import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/list_nabung.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/target_widget.dart';
import 'package:tabungan_digital/pages/auth.dart';
import 'package:unicons/unicons.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  String email;
  HomePageView({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Container(
            margin: const EdgeInsets.only(
              left: 14,
            ),
            child: const Text(
              "Tabungan Digital",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 32,
              ),
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primaryBg,
                shape: BoxShape.circle,
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.setTabIndex(0);
                      },
                      child: Obx(
                        () => Text(
                          "Target Tabungan",
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.tabIndex.value == 0
                                ? AppColors.primaryBg
                                : AppColors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    const Text(
                      "|",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    InkWell(
                      onTap: () {
                        controller.setTabIndex(1);
                      },
                      child: Obx(
                        () => Text(
                          "Target Selesai",
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.tabIndex.value == 1
                                ? AppColors.primaryBg
                                : AppColors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            child: Column(
              children: [
                Obx(
                  () => Column(
                    children: controller.tabIndex.value == 0
                        ? [
                            const CardSaving(
                              savingName: "Rumah",
                              percentage: 50,
                              savingTarget: 23321213000,
                              time: 500,
                            ),
                            const CardSaving(
                              savingName: "Motor",
                              percentage: 37,
                              savingTarget: 23321213000,
                              time: 3,
                            ),
                            const CardSaving(
                              savingName: "Motor",
                              percentage: 37,
                              savingTarget: 23321213000,
                              time: 3,
                            ),
                          ]
                        : [
                            const CardSaving(
                              savingName: "Supra Bapak",
                              percentage: 100,
                              savingTarget: 2051000000,
                              time: 672,
                            ),
                          ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed("/tambah-tabungan-page");
          },
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.white,
          extendedPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          label: const Text(
            'Tambah Tabungan',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.primaryBg,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

class CardSaving extends StatelessWidget {
  final savingName;
  final time;
  final savingTarget;
  final percentage;
  const CardSaving({
    Key? key,
    required this.savingName,
    required this.time,
    required this.savingTarget,
    required this.percentage,
  }) : super(key: key);

  String currencyFormat(int number) {
    var currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    var currencyString = currency.format(number);
    return currencyString;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/mazda-rx7.png",
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            savingName,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Text(
                      currencyFormat(savingTarget),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "tercapai Dalam Waktu $time Bulan",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              CircularPercentIndicator(
                radius: 28,
                lineWidth: 4,
                animation: true,
                percent: percentage / 100,
                center: Text(
                  "$percentage%",
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
                progressColor: AppColors.success,
                backgroundColor: AppColors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
