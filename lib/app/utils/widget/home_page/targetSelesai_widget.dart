import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/tercapai_page/controllers/tercapai_page_controller.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class TargetSelesai extends StatelessWidget {
  var index;
  TargetSelesai({
    Key? key,
    required this.index,
  }) : super(key: key);

  TercapaiController tabunganController = Get.put(TercapaiController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://source.unsplash.com/random/500x250?${tabunganController.tabunganList[index].nama_tabungan}',
                              ),
                            ),
                            borderRadius: const BorderRadius.all(
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
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBg,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.black,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Target Tabungan
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp.',
                                    decimalDigits: 2,
                                  ).format(
                                    tabunganController
                                        .tabunganList[index].target_tabungan,
                                  ),
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),

                                Row(
                                  children: const [
                                    // Nominal nabung di ambil dari database
                                    Text(
                                      "Tercapai Dalam Waktu",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 500 Bulan",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Presentase Tabungan
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBg,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColors.success,
                                width: 4,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '100%',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
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
            ),
          ],
        ),
      ],
    );
  }
}
