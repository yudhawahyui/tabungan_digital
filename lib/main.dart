import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/firebase_options.dart';
import 'package:tabungan_digital/pages/auth.dart';

import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tabungan Digital App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
