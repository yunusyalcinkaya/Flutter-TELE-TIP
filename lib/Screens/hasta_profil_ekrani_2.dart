import 'package:flutter/material.dart';

class HastaProfilEkrani2 extends StatefulWidget {
  const HastaProfilEkrani2({Key? key}) : super(key: key);

  @override
  _HastaProfilEkraniState createState() => _HastaProfilEkraniState();
}

class _HastaProfilEkraniState extends State<HastaProfilEkrani2> {
  String hastaAdi = "HASTA ADI";
  String hastaSoyadi = "HASTA SOYADI";
  String hastaEpostasi = "HASTA E-POSTA'SI";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HASTA PROFİL EKRANI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/profil.png'),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "AD:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 60),
              Text(
                hastaAdi,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "SOYAD:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 25),
              Text(
                hastaSoyadi,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                "E-POSTA:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                hastaEpostasi,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 30),
          RaisedButton(
            child: Text("MESAJ GÖNDER"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
