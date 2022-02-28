import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Sura {
  final int? id;
  final String? suraName;
  final String? place;
  final int? noOfAyas;
  Sura({this.id, this.suraName, this.place, this.noOfAyas});
}

class SurasProvider with ChangeNotifier {
  List<Sura> _suras = [];

  List<Sura> get suras => _suras;

  Future<void> fetchAndSetSuras() async {
    var url = 'https://api.alquran.cloud/v1/surah';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      var suras = data['data'] as List;
      print(data['data'][0]['name']);
      List<Sura> fetched = [];

      for (var s in data['data'])
        fetched.add(Sura(
            id: s['number'],
            place: s['revelationType'],
            noOfAyas: s['numberOfAyahs'],
            suraName: s['name']));
      // suras.forEach((element) {
      //   fetched.add(Sura(
      //       id: element['number'],
      //       place: element['revelationType'],
      //       noOfAyas: element['numberOfAyahs'],
      //       suraName: element['name']));
      // });
      _suras = fetched;
    }
    notifyListeners();
  }
}

class Quran {
  final String? id;
  final String? suraName;
  final int? ayaNo;
  final List<Aya>? ayas;
  final bool? mecca;
  Quran({this.id, this.suraName, this.ayas, this.mecca, this.ayaNo});
}

class Aya {
  final String ayaText;
  final int ayaNo;

  Aya(this.ayaText, this.ayaNo);
}

class QuranProvider with ChangeNotifier {
  List<Quran> _quran = [];

  List<Quran> get quran => _quran;

  Future<void> fetchAndSetData(int suraNo) async {
    var url = 'https://api.alquran.cloud/v1/surah/$suraNo';
    // 'https://api.alquran.cloud/v1/quran/quran-uthmani';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // List<Quran> _fetchedData = [];
      // for (int i = 0; i < 114; i++) {
      //   var ayas = data['data']['surahs'][i]['ayahs'] as List;
      //   List<String> l = [];
      //   ayas.forEach((element) {
      //     l.add(element['text']);
      //   });

      //   _fetchedData.add(Quran(
      //       id: data['data']['surahs'][i]['number'].toString(),
      //       suraName: data['data']['surahs'][i]['name'],
      //       ayasText: l,
      //       mecca: data['data']['surahs'][i]['revelationType'] == 'Meccan'
      //           ? true
      //           : false));
      // }
      // _quran = _fetchedData;
      var ayasList = data['data']['ayahs'] as List;
      print("ayasList: $ayasList");
      List<Aya> l = [];
      // ayasList.forEach((element) {
      //   l.add(element['text']);
      // });
      List<Quran> fetched = [];
      for (var string in ayasList)
        l.add(Aya(string['text'], string['numberInSurah']));
      fetched.add(Quran(
          id: data['data']['number'].toString(),
          ayas: l,
          suraName: data['data']['name']));
      _quran = fetched;
      notifyListeners();
    }
  }
}
