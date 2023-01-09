import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_search/dropdown_search.dart';
// Zagki Mubarok_2201011186

void main() {
  runApp(KALKULATOR());
}

class KALKULATOR extends StatefulWidget {
  const KALKULATOR({Key? key}) : super(key: key);

  @override
  State<KALKULATOR> createState() => _KALKULATORState();
}

class _KALKULATORState extends State<KALKULATOR> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  List<String> data = [
    "tambah",
    "kurang",
    "bagi",
    "kali",
    "genap",
    "ganjil",
  ];

  //Variabel-----------------------------------------------------
  int? hasil = 0, nilai1 = 0, nilai2 = 0;

  //Rumus----------------------------------------------------------
  tambah() {
    setState(() {
      nilai1 = int.parse(controller1.text);
      nilai2 = int.parse(controller2.text);
      hasil = nilai1! + nilai2!;
    });
  }

  kurang() {
    setState(() {
      nilai1 = int.parse(controller1.text);
      nilai2 = int.parse(controller2.text);
      hasil = nilai1! - nilai2!;
    });
  }

  bagi() {
    setState(() {
      nilai1 = int.parse(controller1.text);
      nilai2 = int.parse(controller2.text);
      hasil = nilai1! ~/ nilai2!;
    });
  }

  kali() {
    setState(() {
      nilai1 = int.parse(controller1.text);
      nilai2 = int.parse(controller2.text);
      hasil = nilai1! * nilai2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.computer),
          title: Text("KALKULATOR"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blueAccent, Colors.black]),
            ),
          ),
        ),
        body: Column(
          children: [
            // container atas -----------------
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "Kalkulator Spinner",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "(KALSPIN)",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //--------------------------
                ],
              ),
            ),
            //---------------------------------
            // container bawah-----------------
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nilai Pertama:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    controller: controller1,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: "Masukan nilai 1 / Nilai Awal",
                    ),
                  ),
                ],
              ),
            ),
            //---------------------------------
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nilai Kedua:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  TextFormField(
                    controller: controller2,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Masukan nilai 2 / Nilai Akhir",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: data,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Pilih Oprasi Matematika",
                    ),
                  ),
                  onChanged: print,
                  selectedItem: "- Pilih Operasi -",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //rumus-------------------------------------------------------
                tambah();
                kurang();
                kali();
                bagi();
                controller1.clear();
                controller2.clear();

                //Notifikasi--------------------------------------------------
                Fluttertoast.showToast(
                  msg: "Operasi Berhasil",
                  toastLength: Toast.LENGTH_LONG,
                  fontSize: 15,
                  timeInSecForIosWeb: 1,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                );
              },
              child: Text("HITUNG"),
              style: ElevatedButton.styleFrom(shadowColor: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 5),
              alignment: Alignment.topLeft,
              child: Column(children: [
                Text(
                  "Hasil : $hasil",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
