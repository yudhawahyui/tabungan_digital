import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/pages/auth.dart';

import '../controllers/login_page_controller.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            height: Get.height * 1,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tabungan_digital_logo_small.png',
                    width: Get.width * 0.75,
                  ),
                  const Text(
                    'Login Dengan Email Yang Sudah Terdaftar!',
                    textAlign: TextAlign.center,
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
                          children: [
                            const Text('Email'),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
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
                          children: [
                            const Text('Password'),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masukkan Password',
                              ),
                            )
                          ],
                        ),
                      ),

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
                            AuthController.instance.login(
                                emailController.text.trim(),
                                passwordController.text.trim());
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                              'Belum memiki akun?',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/register-page-2');
                              },
                              child: const Text(
                                'Daftar',
                                style: TextStyle(
                                    color: AppColors.primaryBg, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
