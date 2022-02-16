import 'package:deneme_1/Screens/giris_ekrani.dart';
import 'package:deneme_1/Screens/hasta_mesaj_ekrani.dart';
import 'package:flutter/material.dart';
import './hasta_profil_ekrani.dart';
import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';

class Hasta_Ana_Ekrani extends StatefulWidget {
  Hasta hasta;

  Hasta_Ana_Ekrani(this.hasta);

  @override
  _Hasta_Ana_EkraniState createState() => _Hasta_Ana_EkraniState();
}

class _Hasta_Ana_EkraniState extends State<Hasta_Ana_Ekrani> {
  String adagore = "doktor adı";
  String uzmanligagore = "uzmanlık alanı";
  String abdgore = "abd adı";

  final controller = TextEditingController();

// i değişkeni listelemenin ad, uzmanlik ve ya abd' ye göre yapılmasını seçiyor
  int i = 0;

  // neye göre listelenecekse(ad,uzmanlık,abd) ona göre durumu değiştiriyor
  // arama butonlarına basıldığında çalışıyor
  void idegistir(int yeni) {
    setState(() {
      i = yeni;
    });
  }

  // butonların gönderdiği i değişkenine göre veritabanından arama
  //      yapan fonksiyonları çağırıyor
  doktorGetir() {
    if (i == 3) {
      return abdDoktor(controller.text);
    } else if (i == 2) {
      return uzmanlikDoktor(controller.text);
    } else {
      return isimDoktor(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HASTA ANA EKRANI"),
      ),
      body: Wrap(
        children: [
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.person_rounded),
                      iconSize: 40.0,
                      highlightColor: Colors.lightBlueAccent,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HastaProfilEkrani(widget.hasta))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(widget.hasta.hasta_ISIM),
                    SizedBox(
                      width: 60,
                    ),
                    RaisedButton(
                      highlightColor: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      elevation: 10.0,
                      child: Text(
                        'Mesaj Kutusu',
                        style: TextStyle(fontSize: 13.5),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Hasta_Mesaj_Ekrani(widget.hasta))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  //inputFormatters: [],
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 18),
                    RaisedButton(
                        highlightColor: Colors.lightBlueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        elevation: 10.0,
                        child: Text(
                          'Ada Göre Ara',
                          style: TextStyle(fontSize: 13.5),
                        ),
                        onPressed: () {
                          idegistir(1);
                          // controller.clear();
                        }),
                    SizedBox(width: 20),
                    RaisedButton(
                      highlightColor: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      elevation: 10.0,
                      child: Text(
                        'Uzmanlığa Göre Ara',
                        style: TextStyle(fontSize: 13.5),
                      ),
                      onPressed: () {
                        idegistir(2);
                        // controller.clear();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      highlightColor: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      elevation: 10.0,
                      child: Text(
                        "ABD'ye Göre Ara",
                        style: TextStyle(
                          fontSize: 13.5,
                        ),
                      ),
                      onPressed: () {
                        idegistir(3);
                        //controller.clear();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: doktorGetir(),
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
                          title: Text(snapshot.data[index].doktor_ISIM),
                          subtitle: Text(snapshot.data[index].doktor_SOYISIM),
                          contentPadding: EdgeInsets.only(bottom: 20.0),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                highlightColor: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                elevation: 10.0,
                child: Text(
                  'Çıkış',
                  style: TextStyle(fontSize: 13.5),
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnaGirisEkrani())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
