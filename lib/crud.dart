import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/utils/widget/detail_tabungan_widget/modal_ambil_tabungan.dart';
import 'package:tabungan_digital/custom_database.dart';
import 'package:tabungan_digital/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('tabungan');
final CollectionReference _RecordCollection = _firestore.collection('record');

class FirebaseCrud {
  static Future<Responseses> addTabungan({
    required int tabungan_id,
    required String user_email,
    required String nama_tabungan,
    required String keterangan,
    required int target_tabungan,
    required String status,
    required String dibuat,
    required int biaya_terkumpul,
    required String gambar,
    required String rencana,
    required int nominal_pengisian,
  }) async {
    Responseses response = Responseses();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "tabungan_id": tabungan_id,
      "user_email": user_email,
      "nama_tabungan": nama_tabungan,
      "keterangan": keterangan,
      "target_tabungan": target_tabungan,
      "status": status,
      "dibuat": dibuat,
      "biaya_terkumpul": biaya_terkumpul,
      "gambar": gambar,
      "rencana": rencana,
      "nominal_pengisian": nominal_pengisian,
    };

    print(data);

    var result = await documentReferencer
        .set(data)
        .whenComplete(() => {
              // snack bar
              Get.snackbar('Success', 'Tabungan berhasil ditambahkan'),
              response.code = 200,
              response.message = 'Tabungan berhasil ditambahkan',
            })
        .catchError((e) {
      print(e.toString());
      // Get.snackbar('Error', 'Tabungan gagal ditambahkan');
      // response.code = 400;
      // response.message = 'Tabungan gagal ditambahkan';
    });
    // return back to home page;
    return response;
  }

  static Future<Responseses> addSaldoTabungan(
      {required String recordId,
      required String tabunganId,
      required int nominal,
      required String keterangan,
      required String status,
      required String tanggal,
      required String docId,
      required int target,
      required int biaya_terkumpul}) async {
    Responseses response = Responseses();
    DocumentReference documentReferencer = _RecordCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "record_id": recordId,
      "tabungan_id": tabunganId,
      "nominal": nominal,
      "keterangan": keterangan,
      "status": status,
      "tanggal": tanggal,
    };

    print(data);

    var result = await documentReferencer
        .set(data)
        .whenComplete(() => {
              // snack bar
              Get.snackbar('Success', 'Tabungan berhasil ditambahkan'),
              response.code = 200,
              response.message = 'Tabungan berhasil ditambahkan',
            })
        .catchError((e) {
      print(e.toString());
      // Get.snackbar('Error', 'Tabungan gagal ditambahkan');
      // response.code = 400;
      // response.message = 'Tabungan gagal ditambahkan';
    });
    // return back to home page;
    // send result nominal to update tabungan

    updateTabungan(
        biaya_terkumpul: biaya_terkumpul,
        docId: docId,
        tabungan_id: tabunganId,
        target: target,
        nominal: data['nominal']);
    return response;
  }

  static Future<Responseses> updateTabungan({
    String? tabungan_id,
    String? docId,
    int? target,
    int? biaya_terkumpul,
    int? nominal,
  }) async {
    var status = 'aktif';
    var biaya = biaya_terkumpul! + nominal!;

    if (biaya >= target!) {
      // update status tabungan
      status = 'tercapai';
    }

    Responseses response = Responseses();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "target_tabungan": target,
      "biaya_terkumpul": biaya,
      "status": status,
    };

    print(data);

    var result = await documentReferencer
        .update(data)
        .whenComplete(() => {
              // snack bar
              Get.snackbar('Success', 'Tabungan berhasil diupdate'),
              response.code = 200,
              response.message = 'Tabungan berhasil diupdate',
            })
        .catchError((e) {
      print(e.toString());
      Get.snackbar('Error', 'Tabungan gagal diupdate');
      response.code = 400;
      response.message = 'Tabungan gagal diupdate';
    });
    // return back to home page;
    return response;
  }

  static Future<Responseses> deleteTabungan({
    required String tabungan_id,
    required String docId,
  }) async {
    Responseses response = Responseses();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => {
              // snack bar
              Get.snackbar('Success', 'Tabungan berhasil dihapus'),
              response.code = 200,
              response.message = 'Tabungan berhasil dihapus',
            })
        .catchError((e) {
      print(e.toString());
      Get.snackbar('Error', 'Tabungan gagal dihapus');
      response.code = 400;
      response.message = 'Tabungan gagal dihapus';
    });

    return response;
  }
}
