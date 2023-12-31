import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdateMahasiswaView extends GetView<UpdateMahasiswaController> {
  const UpdateMahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateMahasiswaView'),
        centerTitle: true,
      ),

    body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
         var data = snapshot.data!.data() as Map<String, dynamic>;
         controller.cNpm.text = data['npm'];
         controller.cNama.text = data['name'];
         controller.cAlamat.text = data['address'];
         controller.cProgram_studi.text = data['study'];
         controller.cJk.text = data['gender'];



     
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Produk"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cHarga,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Harga Produk"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.updateProduct(
                controller.cNama.text,
                controller.cHarga.text,
                Get.arguments,
              ),
              child: Text("Ubah"),
            ),
          ],
        )
      );
          }
      return Center(
        child: CircularProgressIndicator(),
      );
          }
    ),
    );
  }
}
