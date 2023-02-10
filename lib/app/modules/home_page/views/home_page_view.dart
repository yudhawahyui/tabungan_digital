import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/list_nabung.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/target_widget.dart';
import 'package:tabungan_digital/pages/auth.dart';
import 'package:unicons/unicons.dart';
// import 'package:flutter/src/rendering/box.dart'

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  String email;
  HomePageView({
    Key? key,
    required this.email,
  }) : super(key: key);

  TestController tabunganController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      initState: (_) {},
      builder: (tabunganController) {
        tabunganController.getData();
        // print(tabunganController.getData());
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed('/tambah-tabungan-page');
            },
            foregroundColor: AppColors.black,
            backgroundColor: AppColors.white,
            label: const Text('Tambah Tabungan'),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.primaryBg,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            icon: const Icon(
              UniconsLine.plus,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 32,
              right: 32,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tabungan Digital',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.black,
                      ),
                      onPressed: AuthController.instance.logOut,
                      child: const Icon(UniconsLine.sign_out_alt),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryBg,
                      ),
                      onPressed: () {},
                      child: const Text('Target Nabung'),
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppColors.black,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.black,
                      ),
                      onPressed: () {},
                      child: const Text('Target Selesai'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: tabunganController.isLoading
                            ? CircularProgressIndicator()
                            : ListView.separated(
                                itemCount:
                                    tabunganController.tabunganList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, index) {
                                  // if data not yet loaded from API then show loading indicator
                                  // print(tabunganController
                                  // .tabunganList[index].nama_tabungan);
                                  return Card(
                                    color: Colors.greenAccent,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              tabunganController
                                                  .tabunganList[index]
                                                  .nama_tabungan,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              tabunganController
                                                  .tabunganList[index]
                                                  .user_email,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              tabunganController
                                                  .tabunganList[index]
                                                  .keterangan,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, index) {
                                  return Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
                // TargetNabung(),
                // TargetSelesai()
              ],
            ),
          ),
        ));
      },
    );
  }
}
