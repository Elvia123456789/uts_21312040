import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference mahasiswafirestore.collection('mahasiswa');

    return mahasiswa.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswafirestore.collection('products');
    return mahasiswa.snapshots();
  }
  void deleteMahasiswa(String id){
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakan anda yakin menghapus data ini",
        onConfirm: (){
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal"
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
    
  }
}