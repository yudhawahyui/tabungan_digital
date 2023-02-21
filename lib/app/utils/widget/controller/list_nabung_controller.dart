import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tabungan_digital/custom_database.dart';
import 'package:tabungan_digital/tabuganListModel.dart';

class TabunganList extends GetxController {
  var tabunganId;

  // constructor
  TabunganList({required this.tabunganId});

  bool isLoading = false;
  var tabunganList = <TabunganListModel>[].obs;
  List data = [].obs;

  void onInit() async {
    // get parameter from previous page

    super.onInit();
    // getData();
    await FirebaseFirestore.instance
        .collection('record')
        .orderBy('record_id')
        .where('tabungan_id', isEqualTo: tabunganId)
        .get()
        .then((QuerySnapshot) {
      QuerySnapshot.docs.forEach((element) {
        tabunganList.add(
          TabunganListModel(
            record_id: element['record_id'],
            tabungan_id: element['tabungan_id'],
            keterangan: element['keterangan'],
            status: element['status'],
            nominal: element['nominal'],
            tanggal: element['tanggal'],
            docId: element.id,
          ),
        );
      });
    });
    print('testing Record');
    update();
  }

  Future<List> getData() async {
    bool isLoading = true;
    try {
      QuerySnapshot tabungans = await FirebaseFirestore.instance
          .collection('record')
          .orderBy('record_id')
          .where('tabungan_id', isEqualTo: tabunganId)
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
          tabunganList.add(TabunganListModel(
            record_id: tabungan['record_id'],
            tabungan_id: tabungan['tabungan_id'],
            keterangan: tabungan['keterangan'],
            status: tabungan['status'],
            nominal: tabungan['nominal'],
            tanggal: tabungan['tanggal'],
            docId: tabungan.id,
          ));
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
