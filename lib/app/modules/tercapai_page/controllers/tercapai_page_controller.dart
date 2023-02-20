import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/custom_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TercapaiController extends GetxController {
  bool isLoading = false;
  var tabunganList = <TabunganModel>[].obs;
  List data = [].obs;
  final user = FirebaseAuth.instance.currentUser!;

  void onInit() async {
    super.onInit();
    // getData();
    await FirebaseFirestore.instance
        .collection('tabungan')
        .orderBy('dibuat')
        .where('user_email', isEqualTo: user.email!)
        .where('status', isEqualTo: 'tercapai')
        .get()
        .then((QuerySnapshot) {
      QuerySnapshot.docs.forEach((element) {
        tabunganList.add(
          TabunganModel(
            tabungan_id: element['tabungan_id'],
            user_email: element['user_email'],
            nama_tabungan: element['nama_tabungan'],
            keterangan: element['keterangan'],
            target_tabungan: element['target_tabungan'],
            status: element['status'],
            dibuat: element['dibuat'],
            biaya_terkumpul: element['biaya_terkumpul'],
            gambar: element['gambar'],
            rencana: element['rencana'],
            nominal_pengisian: element['nominal_pengisian'],
            docId: element.id,
          ),
        );
      });
    });
    print('testing Tercapai');
    update();
  }

  Future<List> getData() async {
    bool isLoading = true;
    try {
      QuerySnapshot tabungans = await FirebaseFirestore.instance
          .collection('tabungan')
          .orderBy('dibuat')
          .where('user_email', isEqualTo: user.email!)
          .get();

      if (tabungans != null) {
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
              nominal_pengisian: tabungan['nominal_pengisian'],
              docId: tabungan.id));
        }

        return tabunganList;
        isLoading = false;
        // set state
        // if update() is called skip this line

        update(['TestController']);
        // exit loop
        // refresh it one time
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', '${e.toString()}');
    }
    return tabunganList;
  }

  // Stream<DocumentSnapshot<Map<String, dynamic>>> TampilData() async* {
  //   FirebaseFirestore.instance.collection("tabungan").get().then((value) {
  //     for (var i in value.docs) {
  //       data.add(i.data());
  //       print(data);
  //     }
  //   });
  // update da
  // }
}
