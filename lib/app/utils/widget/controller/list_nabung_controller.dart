import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tabungan_digital/custom_database.dart';

class MyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<TabunganModel> tabunganList = RxList<TabunganModel>([]);

  @override
  void onInit() {
    // Listen to changes in the Firestore collection and update tabunganList
    // _firestore.collection('tabungan').where(

    // ).snapshots().listen((snapshot) {

    // });
    super.onInit();
  }
}
