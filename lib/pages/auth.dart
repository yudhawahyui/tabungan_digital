// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_digital/app/modules/detail_tabungan_page/views/detail_tabungan_page_view.dart';
import 'package:tabungan_digital/app/modules/home_page/views/home_page_view.dart';
import 'package:tabungan_digital/app/modules/login_page/views/login_page_view.dart';
import 'package:tabungan_digital/app/modules/wellcome_page/wellcome_page_1/views/wellcome_page_view.dart';
import 'package:tabungan_digital/app/routes/app_pages.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';

class AuthController extends GetxController {
  // avaible everywhere
  // AuthController.instance...
  static AuthController instance = Get.find();

  // email, password ...
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // Our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(
        () => const LoginPageView(),
      );
    } else {
      Get.offAll(
        () => HomePageView(
          email: user.email!,
        ),
      );
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: AppColors.danger,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account Createion Failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
      print(e);
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: AppColors.danger,
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "Login Failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
      print(e);
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
