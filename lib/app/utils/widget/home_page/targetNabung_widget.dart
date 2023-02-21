import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:intl/intl.dart';

class TargetNabung extends StatelessWidget {
  final int index;
  TargetNabung({
    Key? key,
    required this.index,
  }) : super(key: key);

  TestController tabunganController = Get.put(TestController());
  var estimasi_hitung;
  var percent;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TestController(),
      initState: (_) {},
      builder: (controller) {
        // estimasi = tabunganController.tabunganList[index].rencana == 'harian'
        //     ? estimasi_hitung =
        //         tabunganController.tabunganList[index].target_tabungan /
        //             tabunganController.tabunganList[index].nominal_pengisian
        //     : estimasi_hitung =
        //         tabunganController.tabunganList[index].target_tabungan /
        //             tabunganController.tabunganList[index].nominal_pengisian *
        //             30;
        estimasi_hitung =
            tabunganController.tabunganList[index].target_tabungan /
                tabunganController.tabunganList[index].nominal_pengisian;
        percent = tabunganController.tabunganList[index].biaya_terkumpul /
            tabunganController.tabunganList[index].target_tabungan *
            100;
        return Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBg,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // image
                      AspectRatio(
                        aspectRatio: 500 / 250,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://source.unsplash.com/random/500x250?keyboard-mechanical',
                              ),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          tabunganController.tabunganList[index].nama_tabungan,
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Total Tabungan, Target Tabungan, Presentase Tabungan
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'Rp. ',
                                  decimalDigits: 2,
                                ).format(tabunganController
                                    .tabunganList[index].target_tabungan),
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  // Nominal nabung di ambil dari database
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp. ',
                                      decimalDigits: 2,
                                    ).format(tabunganController
                                        .tabunganList[index].nominal_pengisian),
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  tabunganController
                                              .tabunganList[index].rencana ==
                                          "bulanan"
                                      ? const Text(
                                          " Perbulan",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      : const Text(
                                          " Perhari",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Nominal nabung di ambil dari database
                                  Text(
                                    "Estimasi : " +
                                        estimasi_hitung.toStringAsFixed(0),
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  tabunganController
                                              .tabunganList[index].rencana ==
                                          "bulanan"
                                      ? const Text(
                                          " Bulan",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        )
                                      : const Text(
                                          " Hari",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                  // Text(
                                  //   " Bulan Lagi",
                                  //   style: TextStyle(
                                  //     color: AppColors.white,
                                  //     fontSize: 16,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          // Presentase Tabungan
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBg,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.white,
                                width: 4,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              percent.toStringAsFixed(0) + "%",
                              style: const TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Line
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
