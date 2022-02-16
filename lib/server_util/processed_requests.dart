import 'package:deneme_1/server_util/classes.dart';
import 'package:deneme_1/server_util/requests.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* doktorGirisSorgusu(String doktor_MAIL, String doktor_SIFRE) async {
  // Doktor giris ekraninda girilen mail ve sifreyi kontrol eder
  // doktorun varolmasi durumunda cagirildigi yere 0 ve doktorun bilgilarini dondurur
  // var olmamasi duruminda cagirildigi yere 1 ve null dondurur

  List<Doktor> doktorList = await doktorGetRequest();

  for (var item in doktorList) {
    if (item.doktor_MAIL == doktor_MAIL && item.doktor_SIFRE == doktor_SIFRE) {
      return {'durum': 0, 'doktor': item};
    }
  }
  return {'durum': 1, 'doktor': null};
} */

/* hastaGirisSorgusu(String hasta_MAIL, String hasta_SIFRE) async {
  // Hasta giriş ekranında girilen mail ve şifreyi kontrol eder
  // Hastanın varolması durumunda çağırıldığı yere 0 ve hastanın bilgilerini dödürür
  // Hastanın varolmaması ya da hatalı giriş durumunda 1 ve null dödürür

  List<Hasta> hastaList = await hastaGetRequest();

  for (var item in hastaList) {
    if (hasta_MAIL == item.hasta_MAIL && hasta_SIFRE == item.hasta_SIFRE) {
      return {'durum': 0, 'hasta': item};
    }
  }
  return {'durum': 1, 'hasta': null};
} */

Future<List<Mesaj>> mesajEkraniSorgusu(int doktor_ID, int hasta_ID) async {
  //replace your restFull API here.
  var url = "http://37.75.8.238:3000/api/mesajlar/";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<Mesaj> mesajlar = [];
  for (var singleMesaj in responseData) {
    Mesaj mesaj = Mesaj(
        mesaj_ID: singleMesaj['mesaj_ID'],
        doktor_ID: singleMesaj["doktor_ID"],
        hasta_ID: singleMesaj['hasta_ID'],
        mesaj: singleMesaj['mesaj'],
        eklenti_path: singleMesaj['eklenti_path'],
        mesaj_tarihi: singleMesaj['mesaj_tarihi'],
        gonderen: singleMesaj['gonderen']);
    //Adding user to the list.
    if (doktor_ID == mesaj.doktor_ID && hasta_ID == mesaj.hasta_ID) {
      mesajlar.add(mesaj);
    }
  }

  return mesajlar;
}

Future<List<Abd>> abdDoktor(String abd_START) async {
  //replace your restFull API here.
  var url = "http://37.75.8.238:3000/api/doktorlar/anabilimdali";
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  //Creating a list to store input data;
  List<Abd> abdler = [];
  for (var singleAbd in responseData) {
    Abd abd = Abd(
        abd_ISIM: singleAbd['abd_isim'],
        doktor_ID: singleAbd['doktor_ID'],
        doktor_ISIM: singleAbd['doktor_ISIM'],
        doktor_SOYISIM: singleAbd['doktor_SOYISIM']);

    //Adding user to the list.
    if (abd.abd_ISIM.startsWith(abd_START)) {
      abdler.add(abd);
    }
  }
  return abdler;
}

uzmanlikDoktor(String uzmanlik_START) async {
  List<Uzmanlik> eskiList = await uzmanlikGetRequest();
  List<Uzmanlik> yeniList = [];
  for (var item in eskiList) {
    if ((item.uzmanlik_ISIM).startsWith(uzmanlik_START)) {
      yeniList.add(item);
    }
  }
  return yeniList;
}

Future<int> hastaKayit(String hasta_ISIM, String hasta_SOYISIM,
    String hasta_MAIL, String hasta_SIFRE) async {
  List<Hasta> hastaList = await hastaGetRequest();
  for (var item in hastaList) {
    if (item.hasta_MAIL == hasta_MAIL) {
      return 2;
    }
  }
  await hastaGonder(hasta_ISIM, hasta_SOYISIM, hasta_MAIL, hasta_SIFRE);
  return 0;
}

Future<http.Response> hastaGonder(String hasta_ISIM, String hasta_SOYISIM,
    String hasta_MAIL, String hasta_SIFRE) async {
  return await http.post(
      // servere hasta verisi gondermek icin kullanilir
      // kendi basina kullanma, hastaKayit fonksiyonu ile kullan
      Uri.parse("http://37.75.8.238:3000/api/hastalar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'hasta_ISIM': hasta_ISIM,
        'hasta_SOYISIM': hasta_SOYISIM,
        'hasta_SIFRE': hasta_SIFRE,
        'hasta_MAIL': hasta_MAIL
      }));
}

Future<http.Response> mesajGonder(
    int doktor_ID, int hasta_ID, String mesaj, String gonderen) async {
  return await http.post(Uri.parse("http://37.75.8.238:3000/api/mesajlar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'doktor_ID': doktor_ID,
        'hasta_ID': hasta_ID,
        'mesaj': mesaj,
        'gonderen': gonderen
      }));
}

isimDoktor(String doktor_START) async {
  // isime gore doktor arar
  List<Doktor> eskiDoktorList = await doktorGetRequest();
  List<Doktor> yeniDoktorList = [];

  for (var item in eskiDoktorList) {
    if ((item.doktor_ISIM + " " + item.doktor_SOYISIM)
        .startsWith(doktor_START)) {
      yeniDoktorList.add(item);
    }
  }
  return yeniDoktorList;
}

doktorAyarGorunumu1(int doktor_ID) async {
  List<Abd> abdList = await abdGetRequest();
  List<String> doktor = [];

  for (var item2 in abdList) {
    if (item2.doktor_ID == doktor_ID) {
      doktor.add(item2.abd_ISIM);
    }
  }

  return doktor;
}

doktorAyarGorunumu2(int doktor_ID) async {
  List<Uzmanlik> uzmanlikList = await uzmanlikGetRequest();

  List uzmanliklari = [];

  for (var item3 in uzmanlikList) {
    if (item3.doktor_ID == doktor_ID) {
      uzmanliklari.add(item3.uzmanlik_ISIM);
    }
  }
  return uzmanliklari;
}

doktorAyarGorunumu(int doktor_ID) async {
  List<Doktor> doktorList = await doktorGetRequest();
  for (var item in doktorList) {
    if (item.doktor_ID == doktor_ID) {
      return item;
    }
  }
  throw {"Bu ID de doktor bulunmamaktadir"};
}

hastaAyarGorunumu(int hasta_ID) async {
  List<Hasta> hastaList = await hastaGetRequest();
  for (var item in hastaList) {
    if (item.hasta_ID == hasta_ID) {
      return item;
    }
  }
  throw {"Bu ID de hasta bulunmamaktadir"};
}

//mesajGonder(String mesaj, int doktor_ID, int hasta_ID, String gonderen){}
hastaEkraniDoktor(int hasta_ID) async {
  // buglu
  List<Mesaj> mesajListesi = await mesajGetRequest();
  List<Mesaj> essizMesajListesi = [];
  List<Doktor> doktorList = await doktorGetRequest();
  List<Doktor> essizDoktorListesi = [];

  String kimden = 'hasta';

  for (var item in mesajListesi) {
    if (essizmi(essizMesajListesi, item, 'hasta') &&
        item.hasta_ID == hasta_ID) {
      essizMesajListesi.add(item);
    }
  }
  for (var item in essizMesajListesi) {
    for (var item2 in doktorList) {
      if (item.doktor_ID == item2.doktor_ID) {
        essizDoktorListesi.add(item2);
      }
    }
  }
  return essizDoktorListesi;
}

doktorEkraniHasta(int doktor_ID) async {
  List<Mesaj> mesajListesi = await mesajGetRequest();
  List<Mesaj> essizMesajListesi = [];
  List<Hasta> hastaList = await hastaGetRequest();
  List<Hasta> essizHastaListesi = [];
  String kimden = 'doktor';

  for (var item in mesajListesi) {
    if (essizmi(essizMesajListesi, item, 'doktor') &&
        item.doktor_ID == doktor_ID) {
      essizMesajListesi.add(item);
    }
  }
  for (var item in essizMesajListesi) {
    for (var item2 in hastaList) {
      if (item.hasta_ID == item2.hasta_ID) {
        essizHastaListesi.add(item2);
      }
    }
  }
  /* for (var item in essizHastaListesi) { // for debug puposes
    debugPrint(item.hasta_ID.toString()+" "+item.hasta_ISIM+" "+item.hasta_SOYISIM+" "+item.hasta_MAIL);
  } */
  return essizHastaListesi;
}

bool essizmi(List<Mesaj> liste, Mesaj mesaj, String kimden) {
  if (kimden.toLowerCase() == 'doktor') {
    // doktorun listesinde ayni hastandan varmi diye kontrol edilir
    for (var item in liste) {
      if (mesaj.hasta_ID == item.hasta_ID) {
        return false;
      }
    }
    return true;
  } else {
    // hastanin listesinde ayni doktordan varmi diye kontrol edilir
    for (var item in liste) {
      if (mesaj.doktor_ID == item.doktor_ID) {
        return false;
      }
    }
    return true;
  }
}

Future<http.Response> hastaAyarDegisimi(int hasta_ID,
    {String? hasta_ISIM,
    String? hasta_SOYISIM,
    String? hasta_SIFRE,
    String? hasta_FOTO}) async {
  // hasta girdilerdeki isim soyisim sifre alanlarini bos biraktiysa bu fonksiyonu cagirirken oraya null yaz
  Hasta hasta = await hastaAyarGorunumu(hasta_ID);
  if (hasta_SIFRE == null) {
    hasta_SIFRE = hasta.hasta_SIFRE;
  }
  if (hasta_ISIM == null) {
    hasta_ISIM = hasta.hasta_ISIM;
  }
  if (hasta_SOYISIM == null) {
    hasta_SOYISIM = hasta.hasta_SOYISIM;
  }
  if (hasta_FOTO == null) {
    hasta_FOTO = hasta.hasta_FOTO;
  }
  return http.put(Uri.parse("http://37.75.8.238:3000/api/hastalar/$hasta_ID"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'hasta_ID': hasta.hasta_ID,
        'hasta_ISIM': hasta_ISIM,
        'hasta_SOYISIM': hasta_SOYISIM,
        'hasta_MAIL': hasta.hasta_MAIL,
        'hasta_SIFRE': hasta_SIFRE,
        'hasta_FOTO': hasta_FOTO
      }));
}

// yapmayi unutma
Future<http.Response> doktorAyarDegisim(int doktor_ID,
    {String? doktor_ISIM,
    String? doktor_SOYISIM,
    String? doktor_SIFRE,
    String? doktor_FOTO}) async {
  Doktor doktor = await doktorAyarGorunumu(doktor_ID);
  if (doktor_SIFRE == null) {
    doktor_SIFRE = doktor.doktor_SIFRE;
  }
  if (doktor_ISIM == null) {
    doktor_ISIM = doktor.doktor_ISIM;
  }
  if (doktor_SOYISIM == null) {
    doktor_SOYISIM = doktor.doktor_SOYISIM;
  }
  if (doktor_FOTO == null) {
    doktor_FOTO = doktor.doktor_FOTO;
  }
  return http.put(Uri.parse("http://37.75.8.238:3000/api/doktorlar/$doktor_ID"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'doktor_ID': doktor.doktor_ID,
        'doktor_ISIM': doktor_ISIM,
        'doktor_SOYISIM': doktor_SOYISIM,
        'doktor_MAIL': doktor.doktor_MAIL,
        'doktor_SIFRE': doktor_SIFRE,
        'doktor_FOTO': doktor_FOTO
      }));
}
