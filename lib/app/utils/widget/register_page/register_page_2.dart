import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class registerPage1 extends StatelessWidget {
  const registerPage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/tabungan_digital_logo_small.png',
            width: Get.width * 0.75,
          ),
          const Text(
            'Mulai',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: Get.width * 1,
            decoration: BoxDecoration(
              color: AppColors.primaryBg,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primaryBg, width: 3),
            ),
            child: TextButton(
              onPressed: () {
                Get.toNamed('/register-page');
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Daftar Dengan Email",
                  style: TextStyle(color: AppColors.black, fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah Daftar?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login-page');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: AppColors.primaryBg, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
