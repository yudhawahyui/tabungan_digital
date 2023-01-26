import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class registerPage2 extends StatelessWidget {
  const registerPage2({
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
            'Buat Akun Anda',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form Email
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Email'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan Email',
                      ),
                    ),
                  ],
                ),
              ),

              // Form Password
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Password'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan Password',
                      ),
                    )
                  ],
                ),
              ),

              // If Form Email & Password is not valid

              // State Email & Password must be valid!
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text(
              //         'Email anda salah! Masukkan email yang valid!',
              //         style: TextStyle(color: AppColors.danger, fontSize: 12),
              //       ),
              //       Text(
              //         'Password  harus mengandung huruf dan angka!',
              //         style: TextStyle(color: AppColors.danger, fontSize: 12),
              //       ),
              //     ],
              //   ),
              // ),

              // State Password must be valid!
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text(
              //         'Password  harus terdiri dari 8-16 karakter',
              //         style: TextStyle(color: AppColors.danger, fontSize: 12),
              //       ),
              //       Text(
              //         'Password  harus mengandung huruf dan angka!',
              //         style: TextStyle(color: AppColors.danger, fontSize: 12),
              //       ),
              //     ],
              //   ),
              // ),

              // Button Daftar
              Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBg,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextButton(
                  onPressed: () {
                    // Function Here
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
