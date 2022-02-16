import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';
import 'package:flutter/material.dart';
import 'package:deneme_1/Screens/hasta_profil_ekrani.dart';
import 'package:deneme_1/server_util/requests.dart';

class HastaProfilDuzenleme extends StatefulWidget {
  // const HastaProfilDuzenleme({Key? key}) : super(key: key);
  Hasta hasta;
  HastaProfilDuzenleme(this.hasta);
  @override
  _HastaProfilDuzenlemeState createState() => _HastaProfilDuzenlemeState();
}

class _HastaProfilDuzenlemeState extends State<HastaProfilDuzenleme> {
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HASTA PROFİL DÜZENLEME EKRANI"),
      ),
      body: Center(
        child: Wrap(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/profil.png'),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("Fotoğrafı Değiştir"),
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: adController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'AD',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: soyadController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'SOYAD',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: sifreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'YENİ ŞİFRE',
                ),
              ),
            ),
            RaisedButton(
              child: Text("Güncelle"),
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              onPressed: () {
                hastaAyarDegisimi(widget.hasta.hasta_ID,
                    hasta_ISIM: adController.text,
                    hasta_SOYISIM: soyadController.text,
                    hasta_SIFRE: sifreController.text);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HastaProfilEkrani(widget.hasta)));
              },
            ),
          ],
          alignment: WrapAlignment.center,
        ),
      ),
    );
  }
}
