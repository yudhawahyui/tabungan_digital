import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/list_nabung.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/modal_ambil_tabungan.dart';
import 'package:unicons/unicons.dart';

class DetailTabunganWidget extends StatelessWidget {
  const DetailTabunganWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _key = GlobalKey<ExpandableFabState>();
    return Scaffold(
      // FAB
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        expandedFabSize: ExpandableFabSize.regular,
        collapsedFabSize: ExpandableFabSize.regular,
        duration: const Duration(milliseconds: 125),
        key: key,
        distance: 60,
        type: ExpandableFabType.up,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryBg,
        closeButtonStyle: const ExpandableFabCloseButtonStyle(
          child: Icon(UniconsLine.times),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primaryBg,
        ),
        overlayStyle: ExpandableFabOverlayStyle(
          blur: 1.5,
        ),
        children: [
          // Button Tambah Tabungan
          TextButton.icon(
            label: const Text(
              'Tambah Tabungan',
            ),
            onPressed: () {
              // Function Here
              showDialog(
                context: context,
                builder: (context) {
                  return const modalTambahTabungan();
                },
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(12),
              fixedSize: const Size(190, 50),
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryBg,
              alignment: AlignmentDirectional.centerStart,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.secondaryBg,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(UniconsLine.money_insert),
          ),
          //button ambil tabungan
          TextButton.icon(
            label: const Text(
              'Ambil Tabungan',
            ),
            onPressed: () {
              // Function Here
              showDialog(
                context: context,
                builder: (context) {
                  return const modalAmbilTabungan();
                },
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(12),
              fixedSize: const Size(190, 50),
              alignment: AlignmentDirectional.centerStart,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryBg,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.secondaryBg,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(UniconsLine.money_withdraw),
          ),
          // Button Hapus Tabungan
          TextButton.icon(
            label: const Text(
              'Hapus Tabungan',
            ),
            onPressed: () {
              // Function Here
              showDialog(
                context: context,
                builder: (context) {
                  return const modalHapusTabungan();
                },
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(12),
              alignment: AlignmentDirectional.centerStart,
              fixedSize: const Size(190, 50),
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryBg,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.secondaryBg,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(UniconsLine.trash_alt),
          ),
        ],
      ),
      // End FAB
      // Body
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(UniconsLine.angle_left_b),
                    ),
                    const Text(
                      'Detail Tabungan',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/mazda-rx7.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Text(
                              "Supra Bapak",
                              style: TextStyle(
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
                                  // Target Tabungan
                                  const Text(
                                    "Rp.2.051.000.000",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: const [
                                      // Nominal nabung di ambil dari database
                                      Text(
                                        "Rp.135.000",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        " Perbulan",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Presentase Tabungan
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBg,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: AppColors.white,
                                    width: 4,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  '0%',
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Line
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Container(
                              height: 2,
                              width: Get.width * 1,
                              color: AppColors.white,
                            ),
                          ),
                          // Detail Lebih lanjut ( dibuat, di kumpulkan, kurang, estimasi waktu)
                          // Dibuat
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Dibuat",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              ),
                              // Presentase Tabungan
                              Text(
                                '23 Jan 2023',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Dikumpulkan
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Dikumpulkan",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              ),
                              // Presentase Tabungan
                              Text(
                                'Rp.135.000',
                                style: TextStyle(
                                    color: AppColors.success,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Kurang
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Kurang",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              ),
                              // Presentase Tabungan
                              Text(
                                'Rp.2.050.865.000',
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Estimasi Waktu",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                ),
                              ),
                              // Presentase Tabungan
                              Row(
                                children: const [
                                  Text(
                                    '1.000',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' Bulan',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // History Tabungan
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 4,
              ),
              child: const Text(
                'History Tabungan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const historyNabung(),
          ],
        ),
      ),
    );
  }
}
