import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class historyNabung extends StatelessWidget {
  const historyNabung({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const listNabung();
        },
      ),
    );
  }
}

class listNabung extends StatelessWidget {
  const listNabung({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "24 Januari 20231",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Keterangan",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rp.150.000",
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
              color: AppColors.white,
              height: 1,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "23 Januari 20231",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Keterangan",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Rp.100.000",
                      style: TextStyle(
                        color: AppColors.success,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
              color: AppColors.white,
              height: 1,
            ),
          ],
        ),
      ],
    );
  }
}
