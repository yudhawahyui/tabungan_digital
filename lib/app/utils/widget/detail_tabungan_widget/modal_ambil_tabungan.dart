import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class modalAmbilTabungan extends StatelessWidget {
  const modalAmbilTabungan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ambil Tabungan',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // Form input nominal
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Nominal',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // form input keterangan
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Keterangan',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
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

class modalTambahTabungan extends StatelessWidget {
  const modalTambahTabungan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Tabungan',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // Form input nominal
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Nominal',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // form input keterangan
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Keterangan',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
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

class modalHapusTabungan extends StatelessWidget {
  const modalHapusTabungan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hapus Tabungan',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
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
