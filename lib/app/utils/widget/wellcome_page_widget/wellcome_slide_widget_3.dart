import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class wellcome3 extends StatelessWidget {
  const wellcome3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/tabungan_digital_logo_small.png',
            width: Get.width * 0.75,
          ),
          const Text(
            'Jangan ragu menabung demi masa depanmu! nabung bareng kami!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Dot 1
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  // Dot 2
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  // Dot 3
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  // Dot 4
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  'Slide Untuk Ke Halaman Ke-4',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
