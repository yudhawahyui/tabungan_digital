import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:tabungan_digital/app/routes/app_pages.dart';
import 'package:tabungan_digital/app/utils/style/AppColors.dart';
import 'package:tabungan_digital/app/utils/widget/controller/deleteTabunganController.dart';
import 'package:tabungan_digital/crud.dart';

class modalAmbilTabungan extends StatelessWidget {
  const modalAmbilTabungan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ambil Tabungan',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // Form input nominal
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Nominal',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // form input keterangan
              const TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryBg,
                    ),
                  ),
                  labelText: 'Keterangan',
                  labelStyle: TextStyle(color: AppColors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class modalTambahTabungan extends StatelessWidget {
  var tabunganId;
  var biayaTerkumpul;
  var target;
  var docId;

  // cpnstructor
  modalTambahTabungan({
    Key? key,
    this.tabunganId,
    this.biayaTerkumpul,
    this.target,
    this.docId,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _keterangan = TextEditingController();
  final _nominal = TextEditingController();

  // create _id form now date time to int
  var _id = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tambah Tabungan',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // Form input nominal
                TextFormField(
                  style: TextStyle(color: AppColors.white),
                  controller: _nominal,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.primaryBg,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.primaryBg,
                      ),
                    ),
                    labelText: 'Nominal',
                    labelStyle: TextStyle(color: AppColors.white),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // form input keterangan
                TextFormField(
                  style: TextStyle(color: AppColors.white),
                  controller: _keterangan,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.primaryBg,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: AppColors.primaryBg,
                      ),
                    ),
                    labelText: 'Keterangan',
                    labelStyle: TextStyle(color: AppColors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var response = await FirebaseCrud.addSaldoTabungan(
                              recordId: _id.toString(),
                              tabunganId: tabunganId,
                              nominal: int.parse(_nominal.text),
                              keterangan: _keterangan.text,
                              status: 'tabung',
                              tanggal: DateTime.now().toString(),
                              biaya_terkumpul: biayaTerkumpul,
                              docId: docId,
                              target: target);
                          // update data
                          Restart.restartApp(webOrigin: AppPages.INITIAL);
                        }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Batal',
                        style: TextStyle(
                          color: AppColors.danger,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class modalHapusTabungan extends StatelessWidget {
  var docId;

  // constructor
  modalHapusTabungan({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeleteTabungan deleteTabungan = Get.put(DeleteTabungan());
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          // set backgeound color
          color: AppColors.secondaryBg,
          borderRadius: BorderRadius.circular(5),
        ),
        width: Get.width * 1,
        height: Get.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hapus Tabungan',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('delete');
                      DeleteTabungan controller = Get.find();
                      controller.deleteDocument(docId);
                      print('delete done');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                        color: AppColors.danger,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
