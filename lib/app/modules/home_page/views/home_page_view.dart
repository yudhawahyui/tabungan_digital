import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/pages/auth.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  String email;
  HomePageView({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePageView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'HomePageView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
              ),
            ),
          ),
          Center(
            child: Text(
              email,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              AuthController.instance.logOut();
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
