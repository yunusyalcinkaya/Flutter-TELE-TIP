import 'package:flutter/material.dart';
import './hasta_profil_duzenleme.dart';
import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';

class HastaProfilEkrani extends StatefulWidget {
  // const HastaProfilEkrani({Key? key}) : super(key: key);
  Hasta hasta;
  HastaProfilEkrani(this.hasta);

  @override
  _HastaProfilEkraniState createState() => _HastaProfilEkraniState();
}

class _HastaProfilEkraniState extends State<HastaProfilEkrani> {
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
                widget.hasta.hasta_ISIM,
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
                widget.hasta.hasta_SOYISIM,
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
                widget.hasta.hasta_MAIL,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 30),
          RaisedButton(
            child: Text("PROFİLİ DÜZENLE"),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HastaProfilDuzenleme(widget.hasta))),
          ),
        ],
      ),
    );
  }
}
