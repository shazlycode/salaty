import 'package:flutter/foundation.dart';

class Moazen {
  final String? id;
  final String? name;
  final String? sound;
  final String? raw;

  Moazen({this.id, this.name, this.sound, this.raw});
}

class MoazenProvider with ChangeNotifier {
  List<Moazen> _moazen = [
    Moazen(
        id: '1',
        name: 'عبد الباسط عبد الصمد',
        sound: 'android/app/src/main/res/raw/a.mp3',
        raw: 'a'),
    Moazen(
        id: '2',
        name: 'سيد النقشبندي',
        sound: 'android/app/src/main/res/raw/b.mp3',
        raw: 'b'),
    Moazen(
        id: '3',
        name: 'محمد رفعت',
        sound: 'android/app/src/main/res/raw/c.mp3',
        raw: 'c'),
  ];

  List<Moazen> get moazens => _moazen;

  String? _sound = 'a';

  String? get sound => _sound;
}
