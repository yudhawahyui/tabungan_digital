import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class TargetNabung extends StatelessWidget {
  const TargetNabung({
    Key? key,
  }) : super(key: key);

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
                              Row(
                                children: const [
                                  // Nominal nabung di ambil dari database
                                  Text(
                                    "1000",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    " Bulan Lagi",
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
