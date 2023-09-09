import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProgram_studi;
  late TextEditingController cJk;

FirebaseFirestore firestore = FirebaseFirestore.instance;

  void mahasiswa(String npm, String nama,String alamat, String program_studi, String jk) async {
    CollectionReference mahasiswa= firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "npm" : npm,
        "name" : nama,
        "address" : alamat,
        "study":program_studi,
        "gender" :jk,
    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil menyimpan data produk",
      onConfirm: (){
        cNpm.clear();
        cNama.clear();
        cAlamat.clear();
        cProgram_studi.clear();
        cJk.clear();

      Get.back();
        Get.back();
        textConfirm: "OK";      }
    );
  }catch (e){

    }

  }
  
  @override
  void onInit() {
    // TODO: implement onInit
        cNpm = TextEditingController(); 
        cNama = TextEditingController();
        cAlamat = TextEditingController();
        cProgram_studi = TextEditingController();
        cJk= TextEditingController();


    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
        cNpm.dispose();
        cNama.dispose();
        cAlamat.dispose();
        cProgram_studi.dispose();
        cJk.dispose();


    super.onClose();
  }
}