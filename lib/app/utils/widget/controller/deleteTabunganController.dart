import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tabungan_digital/app/modules/home_page/views/home_page_view.dart';
import 'package:tabungan_digital/app/modules/login_page/views/login_page_view.dart';

class DeleteTabungan extends GetxController {
  Future<void> deleteDocument(String docId) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('tabungan');
    await collection
        .doc(docId)
        .delete()
        .whenComplete(() => print('Record deleted'))
        .catchError((error) => print('Failed to delete record: $error'));

    // getBack with snackbar data berhasil dihapus
    // goto Homepage
    Get.offAll(() => LoginPageView());
    Get.snackbar('Data berhasil dihapus', 'Data berhasil dihapus',
        snackPosition: SnackPosition.BOTTOM);
  }
}
