import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_digital/app/utils/widget/controller/list_nabung_controller.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/detail_tabungan_widget.dart';

class historyNabung extends StatelessWidget {
  var tabunganId;
  var docId;
  historyNabung({
    Key? key,
    required this.docId,
    required this.tabunganId,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    // TabunganList form tabunganList
    TabunganList tabunganController =
        Get.put(TabunganList(tabunganId: tabunganId));

    // print the data
    return Container(
      height: Get.height * 0.28,
      margin: const EdgeInsets.only(
        top: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(() {
        print('this bruh');
        print(tabunganController.tabunganList);
        if (tabunganController.tabunganList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum Ada Riwayat'),
                // CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: tabunganController.tabunganList.length,
            itemBuilder: (context, index) {
              return
                  // Text(tabunganController.tabunganList[index].keterangan);
                  Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tabunganController.tabunganList[index].tanggal,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            tabunganController.tabunganList[index].keterangan,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      tabunganController.tabunganList[index].status == 'tabung'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp.',
                                    decimalDigits: 2,
                                  ).format(tabunganController
                                      .tabunganList[index].nominal),
                                  style: const TextStyle(
                                    color: AppColors.success,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp.',
                                    decimalDigits: 2,
                                  ).format(tabunganController
                                      .tabunganList[index].nominal),
                                  style: const TextStyle(
                                    color: AppColors.danger,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 4,
                      bottom: 4,
                    ),
                    color: AppColors.white,
                    height: 1,
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
