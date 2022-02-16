import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';
import 'package:flutter/material.dart';
import 'package:deneme_1/Screens/doktor_profil_edit.dart';
import 'package:deneme_1/server_util/requests.dart';

class DoktorProfilEkrani extends StatefulWidget {
  Doktor doktor;
  DoktorProfilEkrani(this.doktor);

  @override
  _DoktorProfilEkraniState createState() => _DoktorProfilEkraniState();
}

class _DoktorProfilEkraniState extends State<DoktorProfilEkrani> {
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
                  widget.doktor.doktor_ISIM,
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
                  widget.doktor.doktor_SOYISIM,
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
                  widget.doktor.doktor_MAIL,
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
                Container(
                  height: 40,
                  child: FutureBuilder(
                    future: doktorAyarGorunumu1(widget.doktor.doktor_ID),
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => ListTile(
                            title: Text(snapshot.data[index]),
                            // contentPadding: EdgeInsets.only(bottom: 20.0),
                          ),
                        );
                      }
                    },
                  ),
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
                  child: FutureBuilder(
                    future: doktorAyarGorunumu2(widget.doktor.doktor_ID),
                    builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => ListTile(
                            title: Text(snapshot.data[index]),
                            // contentPadding: EdgeInsets.only(bottom: 10.0),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("PROFİLİ DÜZENLE"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoktorProfilEdit(widget.doktor))),
            ),
          ],
        ),
      ),
    );
  }
}
