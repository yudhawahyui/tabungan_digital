import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/detail_tabungan_page/views/detail_tabungan_page_view.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
import 'package:tabungan_digital/app/modules/tambah_tabungan_page/views/tambah_tabungan_page_view.dart';
import 'package:tabungan_digital/app/modules/tercapai_page/views/tercapai_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/modal_ambil_tabungan.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetNabung_widget.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetSelesai_widget.dart';
import 'package:tabungan_digital/pages/auth.dart';
import 'package:unicons/unicons.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  String email;
  HomePageView({
    Key? key,
    required this.email,
  }) : super(key: key);
  final auth = Get.find<AuthController>();

  List<Tab> myTab = [
    const Tab(
      child: Text(
        'Target Tabungan',
        style: TextStyle(color: AppColors.black),
      ),
    ),
    const Tab(
      child: Text(
        'Target Selesai',
        style: TextStyle(color: AppColors.black),
      ),
    ),
  ];

  TestController tabunganController = Get.put(TestController());

  Widget _buildDrawer(context) {
    return SizedBox(
      //membuat menu drawer
      child: Drawer(
        //membuat list,
        //list digunakan untuk melakukan scrolling jika datanya terlalu panjang
        child: ListView(
          padding: EdgeInsets.zero,
          //di dalam listview ini terdapat beberapa widget drawable
          children: [
            //membuat list menu
            ListTile(
              title: const Text("Target Tabungan"),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => HomePageView(
                    email: email,
                  ),
                );
                Navigator.of(context).push(route);
              },
            ),
            ListTile(
              title: const Text("Target Tercapai"),
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => TercapaiPageView(
                    email: email,
                  ),
                );
                Navigator.of(context).push(route);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // android
    var state;
    return context.isPhone
        ? GetBuilder<TestController>(
            init: TestController(),
            initState: (_) {},
            builder: (tabunganController) {
              tabunganController.getData();
              return SafeArea(
                child: DefaultTabController(
                  length: myTab.length,
                  child: Scaffold(
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: () {
                        var route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TambahTabunganPageView(),
                        );
                        Navigator.of(context).push(route);
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
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(130),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 32,
                          top: 16,
                          bottom: 16,
                        ),
                        width: Get.width * 1,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Row(
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
                                  onPressed: () => auth.logOut(),
                                  child: const Icon(UniconsLine.sign_out_alt),
                                )
                              ],
                            ),
                            TabBar(
                              indicatorColor: AppColors.primaryBg,
                              tabs: myTab,
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: Container(
                      height: Get.height * .74,
                      child: TabBarView(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: tabunganController.tabunganList.length,
                              itemBuilder: (BuildContext context, index) {
                                // if data not yet loaded from API then show loading indicator
                                // print(tabunganController
                                // .tabunganList[index].nama_tabungan);
                                return GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('/detail-tabungan-page',
                                    //     arguments: tabunganController
                                    //         .tabunganList[index].tabungan_id);
                                    var route = MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailTabunganPageView(),
                                    );
                                    Navigator.of(context).push(route);
                                  },
                                  child: TargetNabung(
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return TargetSelesai(
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        // Web
        : GetBuilder<TestController>(
            init: TestController(),
            initState: (_) {},
            builder: (tabunganController) {
              tabunganController.getData();
              return Scaffold(
                drawer: _buildDrawer(context),
                appBar: AppBar(
                  backgroundColor: AppColors.primaryBg,
                  title: Container(
                    width: Get.width * 1,
                    child: Row(
                      children: [
                        const Text("Tabungan Digital - Target Tabungan"),
                        const SizedBox(
                          width: 100,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                fixedSize: const Size(190, 25),
                                foregroundColor: AppColors.white,
                                backgroundColor: AppColors.primaryBg,
                                alignment: AlignmentDirectional.center,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColors.secondaryBg,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return TambahTabunganPageView();
                                  },
                                );
                              },
                              child: const Text(
                                "Tambah Tabungan",
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.black,
                              ),
                              onPressed: () => AuthController.instance.logOut(),
                              child: const Icon(
                                UniconsLine.sign_out_alt,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                body: HomeTargetTabungan(),
                //memberikan button garis tiga disebelah kiri appbar
                //jika ditekan akan menjalankan widget builddrawer
              );
            },
          );
  }
}

class HomeTargetTabungan extends StatelessWidget {
  HomeTargetTabungan({
    super.key,
  });
  TestController tabunganController = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: tabunganController.tabunganList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => DetailTabunganPageView(),
                );
                Navigator.of(context).push(route);
              },
              child: TargetNabung(
                index: index,
              ),
            );
          }),
    );
  }
}
