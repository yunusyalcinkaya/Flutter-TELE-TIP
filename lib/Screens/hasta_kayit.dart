//bütün işlemler tamam
//kayıt işlemi buton içinde yorum satırında

import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';
import 'package:flutter/material.dart';
import 'package:deneme_1/Screens/hasta_giris.dart';

class HastaKayitEkrani extends StatefulWidget {
  // HastaKayitEkrani({Key? key}) : super(key: key);

  @override
  _HastaKayitEkraniState createState() => _HastaKayitEkraniState();
}

class _HastaKayitEkraniState extends State<HastaKayitEkrani> {
  // TextField içeriklerini tutan kontrolcüler
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final ePostaController = TextEditingController();
  final sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HASTA KAYIT EKRANI"),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: adController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'AD',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: soyadController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'SOYAD',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: ePostaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-POSTA',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: sifreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ŞİFRE',
              ),
            ),
            RaisedButton(
              onPressed: () {
                hastaKayit(adController.text, soyadController.text,
                    ePostaController.text, sifreController.text);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Hasta_Giris()));
              },
              child: const Text("KAYIT OL"),
            ),
          ],
        ),
      ),
    );
  }
}
