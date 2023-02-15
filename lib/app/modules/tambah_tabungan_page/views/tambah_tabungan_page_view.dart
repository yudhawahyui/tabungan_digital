import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabungan_digital/app/modules/home_page/controllers/tabungan_view_controller.dart';
import 'package:tabungan_digital/app/modules/home_page/views/home_page_view.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/crud.dart';
import 'package:unicons/unicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/tambah_tabungan_page_controller.dart';

class TambahTabunganPageView extends GetView<TambahTabunganPageController> {
  TambahTabunganPageView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TestController tabunganController = Get.put(TestController());
  File? image;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    // setState(() {});
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    final _tabungan_id = TextEditingController();
    final _user_email = TextEditingController();
    final _nama_tabungan = TextEditingController();
    final _keterangan = TextEditingController();
    final _target_tabungan = TextEditingController();
    final _status = TextEditingController();
    final _dibuat = TextEditingController();
    final _biaya_terkumpul = TextEditingController();
    final _gambar = TextEditingController();
    var _rencana;
    final _nominal_pengisian = TextEditingController();
    final now = new DateTime.now();
    final user = FirebaseAuth.instance.currentUser!;
    // create id from timestamp now convert it to string
    final _id = now.millisecondsSinceEpoch.toInt();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Android
          child: context.isPhone
              ? Container(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 16, bottom: 16),
                  child: Column(
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(UniconsLine.angle_left_b),
                          ),
                          const Text(
                            'Tambah Tabungan',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // controller.getImage(ImageSource.gallery);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  // controller.getImage(ImageSource.gallery);
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    getImage();
                                  },
                                  child: Container(
                                    width: Get.width * .5,
                                    height: Get.height * .3,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBg,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        UniconsLine.image,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 1,
                              height: Get.height * .6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      //
                                      controller: _nama_tabungan,
                                      autofocus: true,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Nama tabungan tidak boleh kosong';
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nama tabungan',
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 50,
                                  //   margin: const EdgeInsets.only(top: 16),
                                  //   child: const TextField(
                                  //     decoration: InputDecoration(
                                  //       border: OutlineInputBorder(),
                                  //       labelText: 'Nama tabungan',
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    height: 50,
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Keterangan tidak boleh kosong';
                                        }
                                      },
                                      controller: _target_tabungan,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Target tabungan',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Rencana Pengisisan'),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Center(
                                          child: Container(
                                            width: Get.width * 1,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.primaryBg,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        AppColors.white,
                                                    backgroundColor:
                                                        AppColors.primaryBg,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // pass string "harian" to rencana controller
                                                    _rencana = "harian";
                                                  },
                                                  child: const Text('Harian'),
                                                ),
                                                Container(
                                                  width: 1,
                                                  height: 10,
                                                  color: AppColors.white,
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        AppColors.white,
                                                    backgroundColor:
                                                        AppColors.primaryBg,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text('Bulanan'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      controller: _nominal_pengisian,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Nominal pengisian tidak boleh kosong';
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nominal pengisian',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      controller: _keterangan,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Keterangan tidak boleh kosong';
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Keterangan',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: Center(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(12),
                                          foregroundColor: AppColors.white,
                                          backgroundColor: AppColors.primaryBg,
                                          alignment:
                                              AlignmentDirectional.center,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () async {
                                          print('tombol simpan ditekan');
                                          print(
                                              "tabungan id :" + _id.toString());
                                          print("email User :" + user.email!);
                                          print("nama Tabungan: " +
                                              _nama_tabungan.text);
                                          print(
                                              "keterangan:" + _keterangan.text);
                                          print("Target : " +
                                              _target_tabungan.text);
                                          print("Nominal Pengisian : " +
                                              _nominal_pengisian.text);
                                          print("Rencana : " + _rencana);
                                          print("sekarang: " + now.toString());
                                          print('formkey :' +
                                              _formKey.currentState.toString());

                                          if (_formKey.currentState!
                                              .validate()) {
                                            var response =
                                                await FirebaseCrud.addTabungan(
                                                    tabungan_id: _id,
                                                    user_email:
                                                        // get email from main controller
                                                        user.email!,
                                                    nama_tabungan:
                                                        _nama_tabungan.text,
                                                    keterangan:
                                                        _keterangan.text,
                                                    target_tabungan: int.parse(
                                                        _target_tabungan.text),
                                                    status: "aktif",
                                                    dibuat: now.toString(),
                                                    biaya_terkumpul: 0,
                                                    gambar: "not Yet There",
                                                    rencana: "harian",
                                                    nominal_pengisian:
                                                        int.parse(
                                                            _nominal_pengisian
                                                                .text));
                                            if (response != 200) {
                                              Get.snackbar("Gagal",
                                                  "Gagal menambahkan tabungan");
                                            } else {
                                              Get.snackbar("Berhasil",
                                                  "Berhasil menambahkan tabungan");
                                            }

                                            Get.to(
                                              () => HomePageView(
                                                email: _user_email.text,
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('Simpan'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              // Web
              : Center(
                  child: Container(
                    width: Get.width * .5,
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                    child: Column(
                      children: [
                        // Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(UniconsLine.angle_left_b),
                            ),
                            const Text(
                              'Tambah Tabungan',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await getImage();
                                },
                                child: image != null
                                    ? Container(
                                        width: Get.width * .5,
                                        height: Get.height * .3,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryBg,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Image.file(image!,
                                            fit: BoxFit.cover),
                                      )
                                    : Container(
                                        width: Get.width * .5,
                                        height: Get.height * .3,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryBg,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            UniconsLine.image,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                              ),
                              Container(
                                width: Get.width * 1,
                                height: Get.height * .6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 16),
                                      child: TextFormField(
                                        //
                                        controller: _nama_tabungan,
                                        autofocus: true,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Nama tabungan tidak boleh kosong';
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Nama tabungan',
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   height: 50,
                                    //   margin: const EdgeInsets.only(top: 16),
                                    //   child: const TextField(
                                    //     decoration: InputDecoration(
                                    //       border: OutlineInputBorder(),
                                    //       labelText: 'Nama tabungan',
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 16),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Keterangan tidak boleh kosong';
                                          }
                                        },
                                        controller: _target_tabungan,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Target tabungan',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Rencana Pengisisan'),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Center(
                                            child: Container(
                                              width: Get.width * 1,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: AppColors.primaryBg,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          AppColors.white,
                                                      backgroundColor:
                                                          AppColors.primaryBg,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      // pass string "harian" to rencana controller
                                                      _rencana = "harian";
                                                    },
                                                    child: const Text('Harian'),
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 10,
                                                    color: AppColors.white,
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          AppColors.white,
                                                      backgroundColor:
                                                          AppColors.primaryBg,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child:
                                                        const Text('Bulanan'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: TextFormField(
                                        controller: _nominal_pengisian,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Nominal pengisian tidak boleh kosong';
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Nominal pengisian',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: TextFormField(
                                        controller: _keterangan,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Keterangan tidak boleh kosong';
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Keterangan',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 16),
                                      child: Center(
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(12),
                                            foregroundColor: AppColors.white,
                                            backgroundColor:
                                                AppColors.primaryBg,
                                            alignment:
                                                AlignmentDirectional.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () async {
                                            print('tombol simpan ditekan');
                                            print("tabungan id :" +
                                                _id.toString());
                                            print("email User :" + user.email!);
                                            print("nama Tabungan: " +
                                                _nama_tabungan.text);
                                            print("keterangan:" +
                                                _keterangan.text);
                                            print("Target : " +
                                                _target_tabungan.text);
                                            print("Nominal Pengisian : " +
                                                _nominal_pengisian.text);
                                            print("Rencana : " + _rencana);
                                            print(
                                                "sekarang: " + now.toString());
                                            print('formkey :' +
                                                _formKey.currentState
                                                    .toString());

                                            if (_formKey.currentState!
                                                .validate()) {
                                              var response = await FirebaseCrud
                                                  .addTabungan(
                                                      tabungan_id: _id,
                                                      user_email:
                                                          // get email from main controller
                                                          user.email!,
                                                      nama_tabungan:
                                                          _nama_tabungan.text,
                                                      keterangan:
                                                          _keterangan.text,
                                                      target_tabungan: int
                                                          .parse(
                                                              _target_tabungan
                                                                  .text),
                                                      status: "aktif",
                                                      dibuat: now.toString(),
                                                      biaya_terkumpul: 0,
                                                      gambar: "not Yet There",
                                                      rencana: "harian",
                                                      nominal_pengisian:
                                                          int.parse(
                                                              _nominal_pengisian
                                                                  .text));
                                              if (response != 200) {
                                                Get.snackbar("Gagal",
                                                    "Gagal menambahkan tabungan");
                                              } else {
                                                Get.snackbar("Berhasil",
                                                    "Berhasil menambahkan tabungan");
                                              }

                                              Get.to(
                                                () => HomePageView(
                                                  email: _user_email.text,
                                                ),
                                              );
                                            }
                                          },
                                          child: const Text('Simpan'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
