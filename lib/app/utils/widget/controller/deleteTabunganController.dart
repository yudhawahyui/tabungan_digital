import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:tabungan_digital/app/routes/app_pages.dart';
import 'package:tabungan_digital/pages/auth.dart';

class DeleteTabungan extends GetxController {
  AuthController authController = Get.put(AuthController());

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
    Get.snackbar('Data berhasil dihapus', 'Data berhasil dihapus',
        snackPosition: SnackPosition.BOTTOM);
    Restart.restartApp(webOrigin: AppPages.INITIAL);
  }
}
