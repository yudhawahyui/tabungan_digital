import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

import '../controllers/tambah_tabungan_page_controller.dart';

class TambahTabunganPageView extends GetView<TambahTabunganPageController> {
  const TambahTabunganPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.chevron_left_sharp),
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
                  GestureDetector(
                    onTap: () {
                      controller.getImage(ImageSource.gallery);
                    },
                    child: Obx(
                      () => controller.imagePath.value == ""
                          ? Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: AppColors.grey1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.image,
                                color: AppColors.white,
                              ),
                            )
                          : Image.network(
                              controller.imagePath.value,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInput(
                          controller: controller.nameSavingController,
                          label: 'Nama Tabungan',
                        ),
                        TextInput(
                          controller: controller.targetSavingController,
                          label: 'Target Tabungan',
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
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.primaryBg,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Obx(
                                        () => TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: AppColors.white,
                                            backgroundColor:
                                                controller.planSaving.value ==
                                                        "harian"
                                                    ? AppColors.success
                                                    : AppColors.primaryBg,
                                            alignment:
                                                AlignmentDirectional.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.planSaving.value =
                                                "harian";
                                          },
                                          child: const Text('Harian'),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 10,
                                        color: AppColors.white,
                                      ),
                                      Obx(
                                        () => TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: AppColors.white,
                                            backgroundColor:
                                                controller.planSaving.value ==
                                                        "bulanan"
                                                    ? AppColors.success
                                                    : AppColors.primaryBg,
                                            alignment:
                                                AlignmentDirectional.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.planSaving.value =
                                                "bulanan";
                                          },
                                          child: const Text('Bulanan'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextInput(
                          controller: controller.nominalSavingController,
                          label: 'Nominal Tabungan',
                        ),
                        TextInput(
                          controller: controller.informationController,
                          label: 'Keterangan',
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                foregroundColor: AppColors.white,
                                backgroundColor: AppColors.primaryBg,
                                alignment: AlignmentDirectional.center,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                controller.addSaving();
                              },
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

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
