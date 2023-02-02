import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:unicons/unicons.dart';

import '../controllers/tambah_tabungan_page_controller.dart';

class TambahTabunganPageView extends GetView<TambahTabunganPageController> {
  const TambahTabunganPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
          child: Column(
            children: [
              // Header
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
                    'Tambah Tabungan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 1,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.grey1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      UniconsLine.image_plus,
                      color: AppColors.white,
                    ),
                  ),
                  Container(
                    width: Get.width * 1,
                    height: Get.height * .6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          margin: const EdgeInsets.only(top: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nama tabungan',
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.only(top: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Target tabungan',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Rencana Pengisisan'),
                              const SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: Container(
                                  width: Get.width * 1,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.primaryBg,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: AppColors.white,
                                          backgroundColor: AppColors.primaryBg,
                                          alignment:
                                              AlignmentDirectional.center,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text('Harian'),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 10,
                                        color: AppColors.white,
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: AppColors.white,
                                          backgroundColor: AppColors.primaryBg,
                                          alignment:
                                              AlignmentDirectional.center,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text('Bulanan'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nominal pengisian',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Keterangan',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                foregroundColor: AppColors.white,
                                backgroundColor: AppColors.primaryBg,
                                alignment: AlignmentDirectional.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Simpan'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
