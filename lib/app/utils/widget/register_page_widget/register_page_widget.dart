import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/login_page/views/login_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/pages/auth.dart';

final auth = Get.find<AuthController>();

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
                Get.toNamed('/register-page-2');
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

class registerPage2 extends StatelessWidget {
  registerPage2({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: context.isPhone
            ? Column(
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
                          children: [
                            const Text('Email'),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                              controller: emailController,
                              obscureText: false,
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
                            AuthController.instance.register(
                                emailController.text.trim(),
                                passwordController.text.trim());
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sudah memiki akun?',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 6),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPageView(),
                                ),
                              ),
                              child: const Text(
                                'Login',
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
              )
            : Center(
                child: Container(
                  color: AppColors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          color: AppColors.white,
                          width: Get.width * 0.4,
                          child: Image.asset(
                            'assets/images/tabungan_digital_logo_small.png',
                            width: Get.width * 0.75,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.5,
                        child: const VerticalDivider(
                          color: AppColors.black,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        width: Get.width * .4,
                        height: Get.height * 1,
                        child: Center(
                          child: Container(
                            // color: AppColors.danger,
                            height: Get.height * 1,
                            width: Get.width * .3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Form Email
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Email'),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                controller: emailController,
                                                obscureText: false,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Masukkan Email',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Form Password
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Password'),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                controller: passwordController,
                                                obscureText: true,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      'Masukkan Password',
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              // Function Here
                                              AuthController.instance.register(
                                                  emailController.text.trim(),
                                                  passwordController.text
                                                      .trim());
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Sudah memiki akun?',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              const SizedBox(width: 6),
                                              TextButton(
                                                onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPageView(),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Login',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.primaryBg,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
