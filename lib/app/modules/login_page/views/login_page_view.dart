import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/ResponsiveLayout.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/login_page_widget/login_page.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ResponsiveLayout(
          largeScreen: loginPageDesktop(),
          smallScreen: loginPage(),
        ),
      ),
    );
  }
}

class loginPageDesktop extends GetView<LoginPageController> {
  const loginPageDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/tabungan_digital_logo_small.png',
            width: Get.width * 0.4,
          ),
          SizedBox(
            width: Get.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login Dengan Email Yang Sudah Terdaftar!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: controller.emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Email',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Password',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryBg,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
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
            ),
          ),
        ],
      ),
    );
  }
}
