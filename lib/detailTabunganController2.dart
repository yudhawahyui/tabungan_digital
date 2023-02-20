import 'package:get/get.dart';
import 'package:tabungan_digital/custom_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class FirestoreController extends GetxController {
//   String docId;

//   FirestoreController({required this.docId});

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Declare a variable to store the selected document
//   Rx<TabunganModel> selectedDocument = Rx<TabunganModel>(null);

//   void onInit() {
//     super.onInit();
//     // Get the collection reference from Firestore
//     final collectionRef = _firestore.collection('tabungan');

//     // Create a stream that listens to changes in the collection
//     final stream = collectionRef.snapshots();

//     // Bind the stream to the RxList variable
//     documents.bindStream(
//       stream.map(
//         (querySnapshot) => querySnapshot.docs
//             .map((document) => TabunganModel.fromMap(document.data()))
//             .toList(),
//       ),
//     );
//   }

//   void setSelectedDocument(TabunganModel document) {
//     selectedDocument.value = document;
//   }

//   void onClose() {
//     if (selectedDocument.value != null) {
//       _firestore.collection('tabungan').doc(selectedDocument.value.id).delete();
//     }
//     super.onClose();
//   }
// }

class FirestoreController extends GetxController {
  String docId;

  FirestoreController({required this.docId});

  // final documents = <DocumentSnapshot>[].obs;
  RxList<DocumentSnapshot> documents = RxList<DocumentSnapshot>([]);

  final user = FirebaseAuth.instance.currentUser!;

  void onInit() {
    // getData();
    super.onInit();
    // clear documents
    fetchDocument(docId);
  }

  // on dispose
  @override
  void fetchDocument(String docId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('tabungan')
        .doc(docId)
        .get();
    documents.value = [snapshot];
  }

  void onClose() {
    // delete the collection
    super.onClose();
    documents.clear();
  }

  // void getData() async {
  //   bool isLoading = true;
  //   try {
  //     QuerySnapshot tabungans = await FirebaseFirestore.instance
  //         .collection('tabungan')
  //         .orderBy('dibuat')
  //         .where('user_email', isEqualTo: user.email!)
  //         .where('tabungan_id', isEqualTo: tabunganId)
  //         .get();

  //     if (tabungans != null) {
  //       tabunganList.clear();

  //       // display tabungans querysnapshot data in console
  //       // print('tabungan data: ${tabungans.docs}');
  //       // loop all data _JsonQueryDocumentSnapshot

  //       // FirebaseFirestore.instance.collection("tabungan").get().then((value) {
  //       //   for (var i in value.docs) {
  //       //     data.add(i.data());
  //       //     print(data);
  //       //   }
  //       // });

  //       for (var tabungan in tabungans.docs) {
  //         // print(tabungan);
  //         tabunganList.add(TabunganModel(
  //             tabungan_id: tabungan['tabungan_id'],
  //             user_email: tabungan['user_email'],
  //             nama_tabungan: tabungan['nama_tabungan'],
  //             keterangan: tabungan['keterangan'],
  //             target_tabungan: tabungan['target_tabungan'],
  //             status: tabungan['status'],
  //             dibuat: tabungan['dibuat'],
  //             biaya_terkumpul: tabungan['biaya_terkumpul'],
  //             gambar: tabungan['gambar'],
  //             rencana: tabungan['rencana'],
  //             nominal_pengisian: tabungan['nominal_pengisian']));
  //       }

  //       update();
  //       isLoading = false;
  //       // set state
  //       // if update() is called skip this line

  //       // exit loop
  //       // refresh it one time
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     Get.snackbar('Error', '${e.toString()}');
  //   }
  //   // return tabunganList;
  // }
}
