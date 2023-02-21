import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/detail_tabungan_page/views/detail_tabungan_page_view.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
import 'package:tabungan_digital/app/modules/home_page/views/home_page_view.dart';
import 'package:tabungan_digital/app/modules/tambah_tabungan_page/views/tambah_tabungan_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetNabung_widget.dart';
import 'package:tabungan_digital/app/utils/widget/home_page/targetSelesai_widget.dart';
import 'package:tabungan_digital/pages/auth.dart';
import 'package:unicons/unicons.dart';

import '../controllers/tercapai_page_controller.dart';

class TercapaiPageView extends GetView<TercapaiController> {
  String email;
  TercapaiPageView({
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

  TercapaiController tabunganController = Get.put(TercapaiController());

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
        ? GetBuilder<TercapaiController>(
            init: TercapaiController(),
            initState: (_) {},
            builder: (tabunganController) {
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
                                          DetailTabunganPageView(
                                        docId: tabunganController
                                            .tabunganList[index].docId,
                                        tabunganId: tabunganController
                                            .tabunganList[index].tabungan_id
                                            .toString(),
                                        biayaTerkumpul: tabunganController
                                            .tabunganList[index]
                                            .biaya_terkumpul,
                                        target: tabunganController
                                            .tabunganList[index]
                                            .target_tabungan,
                                      ),
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
                                itemCount:
                                    tabunganController.tabunganList.length,
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
        : GetBuilder<TercapaiController>(
            init: TercapaiController(),
            initState: (_) {},
            builder: (tabunganController) {
              return Scaffold(
                drawer: _buildDrawer(context),
                appBar: AppBar(
                  backgroundColor: AppColors.primaryBg,
                  title: Container(
                    width: Get.width * 1,
                    child: Row(
                      children: [
                        Row(
                          children: const [
                            Text("Tabungan Digital - Tabungan Selesai"),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.black,
                          ),
                          onPressed: () => AuthController.instance.logOut(),
                          child: const Icon(
                            UniconsLine.sign_out_alt,
                            color: AppColors.white,
                          ),
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
  TercapaiController tabunganController = Get.put(TercapaiController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: tabunganController.tabunganList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => DetailTabunganPageView(
                    docId: tabunganController.tabunganList[index].docId,
                    tabunganId: tabunganController
                        .tabunganList[index].tabungan_id
                        .toString(),
                    biayaTerkumpul:
                        tabunganController.tabunganList[index].biaya_terkumpul,
                    target:
                        tabunganController.tabunganList[index].target_tabungan,
                  ),
                );
                Navigator.of(context).push(route);
              },
              child: TargetSelesai(
                index: index,
              ),
            );
          }),
    );
  }
}
