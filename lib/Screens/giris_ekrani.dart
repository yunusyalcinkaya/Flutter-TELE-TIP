import 'package:deneme_1/Screens/doktor_giris.dart';
import 'package:flutter/material.dart';
import './hasta_giris.dart';

class AnaGirisEkrani extends StatelessWidget {
  const AnaGirisEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 200),
            child: RaisedButton(
              highlightColor: Colors.lightBlueAccent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              child: Text(
                "Doktor",
                style: TextStyle(fontSize: 40),
              ),
              padding: EdgeInsets.all(35),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Doktor_Giris())),
              textColor: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: RaisedButton(
              highlightColor: Colors.lightBlueAccent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white)),
              child: Text(
                "Hasta",
                style: TextStyle(fontSize: 40),
              ),
              padding: EdgeInsets.all(40),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hasta_Giris())),
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}
