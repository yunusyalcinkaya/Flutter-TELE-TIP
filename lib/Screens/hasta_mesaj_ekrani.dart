import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/processed_requests.dart';
import 'package:flutter/material.dart';

class Hasta_Mesaj_Ekrani extends StatefulWidget {
  Hasta hasta;
  Hasta_Mesaj_Ekrani(this.hasta);

  @override
  _Hasta_Mesaj_EkraniState createState() => _Hasta_Mesaj_EkraniState();
}

String Hastaa(var ad, var y) => "$ad $y";

class _Hasta_Mesaj_EkraniState extends State<Hasta_Mesaj_Ekrani> {
  @override
  List<String> konusmalarim = [
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
    Hastaa('scc', 'csa'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HASTA MESAJ EKRANI"),
      ),
      body: Wrap(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  'Konuşmalarım',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: konusmalarim.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: InkWell(
                          onTap: () async {},
                          child: Container(
                            child: Text(
                              '${konusmalarim[index]}',
                              style: TextStyle(color: Colors.black),
                            ),
                            width: 100.0,
                            height: 70.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
