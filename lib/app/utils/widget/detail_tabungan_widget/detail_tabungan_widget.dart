import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restart_app/restart_app.dart';
import 'package:tabungan_digital/app/routes/app_pages.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/list_nabung.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/modal_ambil_tabungan.dart';
import 'package:tabungan_digital/detailTabunganController2.dart';
import 'package:unicons/unicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:html';

class DetailTabunganWidget extends StatelessWidget {
  String docId;
  String tabunganId;
  var target;
  var biaya_terkumpul;

  // constructor
  DetailTabunganWidget({
    Key? key,
    required this.docId,
    required this.tabunganId,
    required this.target,
    required this.biaya_terkumpul,
  }) : super(key: key);

  var estimasi_hitung;
  var percent;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final FirestoreController tabunganController =
        Get.put(FirestoreController(docId: docId));
    // final FirestoreController tabunganController =
    // Get.put(FirestoreController(tabunganId: tabunganId));
    // estimasi_hitung = tabunganController.tabunganList[0].target_tabungan /
    //     tabunganController.tabunganList[0].nominal_pengisian;
    // percent = tabunganController.tabunganList[0].nominal_pengisian /
    //         tabunganController.tabunganList[0].target_tabungan *
    //         100;
    return context.isPhone
        ? Scaffold(
            // FAB
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: ExpandableFab(
              expandedFabSize: ExpandableFabSize.regular,
              collapsedFabSize: ExpandableFabSize.regular,
              duration: const Duration(milliseconds: 125),
              key: key,
              distance: 60,
              type: ExpandableFabType.up,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryBg,
              closeButtonStyle: const ExpandableFabCloseButtonStyle(
                child: Icon(UniconsLine.times),
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.primaryBg,
              ),
              overlayStyle: ExpandableFabOverlayStyle(
                blur: 1.5,
              ),
              children: [
                // Button Tambah Tabungan
                TextButton.icon(
                  label: const Text(
                    'Tambah Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalTambahTabungan(
                          target: target,
                          tabunganId: tabunganId,
                          biayaTerkumpul: biaya_terkumpul,
                          docId: docId,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    fixedSize: const Size(190, 50),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    alignment: AlignmentDirectional.centerStart,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.money_insert),
                ),
                //button ambil tabungan
                TextButton.icon(
                  label: const Text(
                    'Ambil Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalAmbilTabungan(
                          biayaTerkumpul: biaya_terkumpul,
                          docId: docId,
                          tabunganId: tabunganId,
                          target: target,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    fixedSize: const Size(190, 50),
                    alignment: AlignmentDirectional.centerStart,
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.money_withdraw),
                ),
                // Button Hapus Tabungan
                TextButton.icon(
                  label: const Text(
                    'Hapus Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalHapusTabungan(
                          docId: docId,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    alignment: AlignmentDirectional.centerStart,
                    fixedSize: const Size(190, 50),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.trash_alt),
                ),
              ],
            ),
            // End FAB
            // Body
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // tabunganController.dispose();
                              // refresh tabungan
                              // Go to initial page
                              // Get.offAll(() => HomePageView(
                              //       email: user.email!,
                              //     ));
                              // location.reload();
                              // refresh the app
                              // Get.offAll(() => HomePageView(
                              // Navigator.pop(context, true);
                              Restart.restartApp(webOrigin: AppPages.INITIAL);
                            },
                            icon: const Icon(UniconsLine.angle_left_b),
                          ),
                          const Text(
                            'Detail Tabungan',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        var data = tabunganController.documents[0].data()
                            as Map<String, dynamic>;
                        // convert data to map
                        estimasi_hitung =
                            data['target_tabungan'] / data['nominal_pengisian'];
                        percent = data['biaya_terkumpul'] /
                            data['target_tabungan'] *
                            100;
                        var kurang =
                            data['target_tabungan'] - data['biaya_terkumpul'];
                        print(data);
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryBg,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // image
                                  AspectRatio(
                                    aspectRatio: 500 / 250,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://source.unsplash.com/random/500x250?${data['nama_tabungan']}',
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, bottom: 16),
                                    child: Text(
                                      data['nama_tabungan'],
                                      style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // Total Tabungan, Target Tabungan, Presentase Tabungan
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Target Tabungan
                                          Text(
                                            NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp.',
                                              decimalDigits: 2,
                                            ).format(data['target_tabungan']),
                                            // tabunganController
                                            //     .tabunganList[0].target_tabungan
                                            //     .toString(),
                                            style: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              // Nominal nabung di ambil dari database
                                              Text(
                                                NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp.',
                                                      decimalDigits: 2,
                                                    ).format(data[
                                                        'nominal_pengisian']) +
                                                    ' / ',
                                                // tabunganController.tabunganList[0]
                                                //         .nominal_pengisian
                                                //         .toString() +
                                                // " / ",
                                                style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                ),
                                              ),

                                              Text(
                                                data['rencana'].toString(),
                                                // tabunganController
                                                //     .tabunganList[0].rencana,
                                                style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Presentase Tabungan
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryBg,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            color: AppColors.white,
                                            width: 4,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          percent.toStringAsFixed(0) + '%',
                                          style: const TextStyle(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Line
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, bottom: 16),
                                    child: Container(
                                      height: 2,
                                      width: Get.width * 1,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  // Detail Lebih lanjut ( dibuat, di kumpulkan, kurang, estimasi waktu)
                                  // Dibuat
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Dibuat",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      // Presentase Tabungan
                                      Text(
                                        data['dibuat'],
                                        // tabunganController.tabunganList[0].dibuat,
                                        style: const TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // Dikumpulkan
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Dikumpulkan",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      // Presentase Tabungan
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp.',
                                          decimalDigits: 2,
                                        ).format(data['biaya_terkumpul']),
                                        // tabunganController
                                        //     .tabunganList[0].biaya_terkumpul
                                        //     .toString(),
                                        style: const TextStyle(
                                            color: AppColors.success,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // Kurang
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Kurang",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      // Presentase Tabungan
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp.',
                                          decimalDigits: 2,
                                        ).format(kurang),
                                        style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Estimasi Waktu",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      // Presentase Tabungan
                                      Row(
                                        children: [
                                          Text(
                                            estimasi_hitung.toStringAsFixed(0),
                                            style: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          data['rencana'] == 'harian'
                                              ? const Text(
                                                  ' Hari',
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : const Text(
                                                  ' Bulan',
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // clear data
                        );
                      }),
                    ],
                  ),
                  // History Tabungan
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                    ),
                    child: const Text(
                      'History Tabungan',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  historyNabung(docId: docId, tabunganId: tabunganId),
                ],
              ),
            ),
          )
        :
        // web
        Scaffold(
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: ExpandableFab(
              expandedFabSize: ExpandableFabSize.regular,
              collapsedFabSize: ExpandableFabSize.regular,
              duration: const Duration(milliseconds: 125),
              key: key,
              distance: 60,
              type: ExpandableFabType.up,
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primaryBg,
              closeButtonStyle: const ExpandableFabCloseButtonStyle(
                child: Icon(UniconsLine.times),
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.primaryBg,
              ),
              overlayStyle: ExpandableFabOverlayStyle(
                blur: 1.5,
              ),
              children: [
                // Button Tambah Tabungan
                TextButton.icon(
                  label: const Text(
                    'Tambah Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalTambahTabungan(
                          target: target,
                          tabunganId: tabunganId,
                          biayaTerkumpul: biaya_terkumpul,
                          docId: docId,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    fixedSize: const Size(190, 50),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    alignment: AlignmentDirectional.centerStart,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.money_insert),
                ),
                //button ambil tabungan
                TextButton.icon(
                  label: const Text(
                    'Ambil Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalAmbilTabungan(
                          biayaTerkumpul: biaya_terkumpul,
                          docId: docId,
                          tabunganId: tabunganId,
                          target: target,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    fixedSize: const Size(190, 50),
                    alignment: AlignmentDirectional.centerStart,
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.money_withdraw),
                ),
                // Button Hapus Tabungan
                TextButton.icon(
                  label: const Text(
                    'Hapus Tabungan',
                  ),
                  onPressed: () {
                    // Function Here
                    showDialog(
                      context: context,
                      builder: (context) {
                        return modalHapusTabungan(
                          docId: docId,
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    alignment: AlignmentDirectional.centerStart,
                    fixedSize: const Size(190, 50),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.secondaryBg,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(UniconsLine.trash_alt),
                ),
              ],
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                // dispose controller
                                Restart.restartApp(webOrigin: AppPages.INITIAL);
                              },
                              icon: const Icon(UniconsLine.angle_left_b),
                            ),
                            const Text(
                              'Detail Tabungan',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Obx(() {
                          var data = tabunganController.documents[0].data()
                              as Map<String, dynamic>;
                          // convert data to map
                          estimasi_hitung = data['target_tabungan'] /
                              data['nominal_pengisian'];
                          percent = data['biaya_terkumpul'] /
                              data['target_tabungan'] *
                              100;
                          var kurang =
                              data['target_tabungan'] - data['biaya_terkumpul'];
                          print(data);
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryBg,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // image
                                    Row(
                                      children: [
                                        Container(
                                          width: 400,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://source.unsplash.com/random/500x250?${data['nama_tabungan']}',
                                              ),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Container(
                                          width: Get.width * .6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16, bottom: 16),
                                                child: Text(
                                                  data['nama_tabungan'],
                                                  // tabunganController.tabunganList[0]
                                                  //     .nama_tabungan,
                                                  style: const TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Target Tabungan
                                                      Text(
                                                        NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp.',
                                                          decimalDigits: 2,
                                                        ).format(data[
                                                            'target_tabungan']),
                                                        style: const TextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Row(
                                                        children: [
                                                          // Nominal nabung di ambil dari database
                                                          Text(
                                                            NumberFormat
                                                                    .currency(
                                                                  locale: 'id',
                                                                  symbol: 'Rp.',
                                                                  decimalDigits:
                                                                      2,
                                                                ).format(data[
                                                                    'nominal_pengisian']) +
                                                                ' / ',
                                                            style:
                                                                const TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Text(
                                                            data['rencana'],
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  // Presentase Tabungan
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryBg,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              color: AppColors.white,
                                              width: 4,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            percent.toStringAsFixed(0) + '%',
                                            style: const TextStyle(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Line
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      child: Container(
                                        height: 2,
                                        width: Get.width * 1,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    // Detail Lebih lanjut ( dibuat, di kumpulkan, kurang, estimasi waktu)
                                    // Dibuat
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Dibuat",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        // Presentase Tabungan
                                        Text(
                                          data['dibuat'],
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    // Dikumpulkan
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Dikumpulkan",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        // Presentase Tabungan
                                        Text(
                                          NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp.',
                                            decimalDigits: 2,
                                          ).format(data['biaya_terkumpul']),
                                          style: const TextStyle(
                                              color: AppColors.success,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    // Kurang
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Kurang",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        // Presentase Tabungan
                                        Text(
                                          NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp.',
                                            decimalDigits: 2,
                                          ).format(kurang),
                                          style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Estimasi Waktu",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        // Presentase Tabungan
                                        Row(
                                          children: [
                                            Text(
                                              estimasi_hitung
                                                  .toStringAsFixed(0),
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            data['rencana'] == 'harian'
                                                ? const Text(
                                                    ' Hari',
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : const Text(
                                                    ' Bulan',
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    // History Tabungan
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                      ),
                      child: const Text(
                        'History Tabungan',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    historyNabung(
                      docId: docId,
                      tabunganId: tabunganId,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
