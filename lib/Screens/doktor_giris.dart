import 'package:deneme_1/server_util/processed_requests.dart';
import 'package:flutter/material.dart';
import './doktor_ana_ekrani.dart';
import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/requests.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doktor_Giris extends StatelessWidget {
  //Doktor_Giris({Key? key}) : super(key: key);
  final epostaController = TextEditingController();
  final sifreController = TextEditingController();
  static int id = 0;
  static String ad = "";
  static String soyad = "";
  static String eposta = "";
  static String sifre = "";

  Doktor doktor = Doktor(
    doktor_ID: id,
    doktor_ISIM: ad,
    doktor_SOYISIM: soyad,
    doktor_MAIL: eposta,
    doktor_SIFRE: sifre,
  );
  static bool kontrol1 = false;
  Future doktorGirisSorgusu(String doktor_MAIL, String doktor_SIFRE) async {
    List<Doktor> doktorList = await doktorGetRequest();

    for (var item in doktorList) {
      if (item.doktor_MAIL == doktor_MAIL &&
          item.doktor_SIFRE == doktor_SIFRE) {
        id = item.doktor_ID;
        ad = item.doktor_ISIM;
        soyad = item.doktor_SOYISIM;
        eposta = item.doktor_MAIL;
        sifre = item.doktor_SIFRE;
        kontrol1 = true;
      } else {
        kontrol1 = false;
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOKTOR GİRİŞ EKRANI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: epostaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Mail adresinizi Giriniz ....',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Material(
              child: TextFormField(
                controller: sifreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Şifrenizi Giriniz...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              children: [
                RaisedButton(
                    child: Text("Giriş"),
                    textColor: Colors.white,
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      doktorGirisSorgusu(
                          epostaController.text, sifreController.text);
                      print(doktor.doktor_ISIM);
                      print(doktor.doktor_SOYISIM);
                      epostaController.clear();
                      sifreController.clear();

//                      if (kontrol1 == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Doktor_Ana_Ekrani(doktor)));
                      //}
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
