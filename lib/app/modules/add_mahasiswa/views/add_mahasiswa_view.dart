import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddMahasiswaView extends GetView<AddMahasiswaController> {
  const AddMahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mahsiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNpm,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Npm"),
               ),
               SizedBox(
                height : 10,
                ),
             TextField(
            controller: controller.cNama,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cAlamat,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            TextField(
            controller: controller.cProgram_studi,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Program_studi"),
            ),
          SizedBox(
              height: 10,
            ),
            TextField(
            controller: controller.cJk,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Jk"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addMahasiswa(
                controller.cNpm.text,
                controller.cNama.text,
                controller.cAlamat.text,
                controller.cProgram_studi.text,                
                controller.cJk.text,),
              child: Text("Simpan"),
            ),
          ],
        )
      )
    );
  }
}
