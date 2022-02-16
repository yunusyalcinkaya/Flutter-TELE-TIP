import 'package:flutter/material.dart';

class DoktorProfilEkrani2 extends StatefulWidget {
  const DoktorProfilEkrani2({Key? key}) : super(key: key);

  @override
  _DoktorProfilEkrani2State createState() => _DoktorProfilEkrani2State();
}

class _DoktorProfilEkrani2State extends State<DoktorProfilEkrani2> {
  String doktorAdi = "DOKTOR ADI";
  String doktorSoyadi = "DOKTOR SOYADI";
  String doktorEpostasi = "DOKTOR E-POSTA'SI";
  String doktorAnabilimDali = "DOKTOR ANABİLİM DALI";
  List<String> uzmanlikAlanlari = [
    "ALAN 1",
    "ALAN 2",
    "ALAN 3",
    "ALAN 4",
    "ALAN 5"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DOKTOR PROFİL EKRANI")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/profil.png'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "AD:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 60),
                Text(
                  doktorAdi,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "SOYAD:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 25),
                Text(
                  doktorSoyadi,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "E-POSTA:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(
                  doktorEpostasi,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "ANABİLİM DALI(ABD):",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Wrap(
              children: [
                SizedBox(width: 5),
                Text(
                  doktorAnabilimDali,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "UZMANLIK ALANLARI:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              children: [
                Container(
                  height: 140,
                  child: Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      itemCount: uzmanlikAlanlari.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          uzmanlikAlanlari[index],
                          style: TextStyle(fontSize: 18, height: 1.3),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("MESAJ GÖNDER"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
