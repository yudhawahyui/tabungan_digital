import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/custom_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestController extends GetxController {
  bool isLoading = false;
  var tabunganList = <TabunganModel>[];
  List data = [];
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> getData() async {
    bool isLoading = true;
    try {
      QuerySnapshot tabungans = await FirebaseFirestore.instance
          .collection('tabungan')
          .orderBy('dibuat')
          .where('user_email', isEqualTo: user.email!)
          .get();
      tabunganList.clear();

      // display tabungans querysnapshot data in console
      // print('tabungan data: ${tabungans.docs}');
      // loop all data _JsonQueryDocumentSnapshot

      // FirebaseFirestore.instance.collection("tabungan").get().then((value) {
      //   for (var i in value.docs) {
      //     data.add(i.data());
      //     print(data);
      //   }
      // });

      for (var tabungan in tabungans.docs) {
        // print(tabungan);
        tabunganList.add(TabunganModel(
            tabungan_id: tabungan['tabungan_id'],
            user_email: tabungan['user_email'],
            nama_tabungan: tabungan['nama_tabungan'],
            keterangan: tabungan['keterangan'],
            target_tabungan: tabungan['target_tabungan'],
            status: tabungan['status'],
            dibuat: tabungan['dibuat'],
            biaya_terkumpul: tabungan['biaya_terkumpul'],
            gambar: tabungan['gambar'],
            rencana: tabungan['rencana'],
            nominal_pengisian: tabungan['nominal_pengisian']));
      }
      print(tabunganList);
      isLoading = false;
      // set state
      update();
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', '${e.toString()}');
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> TampilData() async* {
    FirebaseFirestore.instance.collection("tabungan").get().then((value) {
      for (var i in value.docs) {
        data.add(i.data());
        print(data);
      }
    });
  }
}
