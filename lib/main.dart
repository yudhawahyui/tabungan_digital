import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/firebase_options.dart';
import 'package:tabungan_digital/pages/auth.dart';

import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get.put(AuthController(), permanent: true);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tabungan Digital App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
