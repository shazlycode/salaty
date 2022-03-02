import 'dart:async';
import 'dart:convert';
import 'package:salaty/providers/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;

class PrayerTime {
  String? id;
  String? date;
  String? fajr;
  String? sunrise;
  String? duhur;
  String? asr;
  String? sunset;
  String? maghrep;
  String? isha;
  DateTime? fajrTime;
  DateTime? duhurTime;
  DateTime? asrTime;
  DateTime? maghripTime;
  DateTime? ishaTime;

  PrayerTime(
      {this.id,
      this.date,
      this.fajr,
      this.sunrise,
      this.duhur,
      this.asr,
      this.sunset,
      this.maghrep,
      this.isha,
      this.fajrTime,
      this.duhurTime,
      this.asrTime,
      this.maghripTime,
      this.ishaTime});
}

class PrayerTimesProvider with ChangeNotifier {
  DateTime? now = DateTime.now();
  List<PrayerTime> _prayerTimes = [];
  List<PrayerTime> get prayerTimes => [..._prayerTimes];
  double? _lat;
  double? _long;
  String? add1;
  String? add2;

  Future getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('locationData')) {
      var data = jsonDecode(prefs.getString('locationData')!);
      _lat = data['lat'];
      _long = data['long'];
      add1 = data['add1'];
      add2 = data['add2'];
      print(add2);
    } else {
      loc.Location location = loc.Location();

      bool _serviceEnabled;
      loc.PermissionStatus _permissionGranted;
      loc.LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == loc.PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != loc.PermissionStatus.granted) {
          return;
        }
      }
      // location.enableBackgroundMode(enable: true);
      _locationData = await location.getLocation();
      _lat = _locationData.latitude;
      _long = _locationData.longitude;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(_lat!, _long!);
      add1 = placemarks[0].locality;
      add2 = placemarks[0].subLocality;
      print(placemarks[0].locality);
      // print(_lat);
      // print(_long);
      await prefs.setString(
          'locationData',
          json.encode(
              {'lat': _lat, 'long': _long, 'add1': add1, 'add2': add2}));
    }
    notifyListeners();
  }

  Future<void> resetLocation() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('locationData');
    await getLocation().whenComplete(() => getDataFromApi());
  }

  Future<void> fetchAndSetPrayerTimes() async {
    return await getLocation().whenComplete(() async {
      await DBHelper.dbQuery().then((value) async {
        // print(value[0]['id']);
        if (value.isNotEmpty) {
          print('Loading from DB');

          List<PrayerTime> _fetched = [];
          for (int i = 0; i < value.length; i++) {
            _fetched.add(PrayerTime(
                id: value[i]['id'],
                fajr: value[i]['fajr'],
                sunrise: value[i]['sunrise'],
                duhur: value[i]['duhur'],
                asr: value[i]['asr'],
                sunset: value[i]['sunset'],
                maghrep: value[i]['maghrep'],
                isha: value[i]['isha'],
                date: value[i]['date'],
                fajrTime: DateTime.parse(
                  value[i]['fajrTime'],
                ),
                duhurTime: DateTime.parse(value[i]['duhurTime']),
                asrTime: DateTime.parse(value[i]['asrTime']),
                maghripTime: DateTime.parse(value[i]['maghrepTime']),
                ishaTime: DateTime.parse(value[i]['ishaTime'])));
          }
          _prayerTimes = _fetched;
          notifyListeners();
        } else {
          await getDataFromApi();
          notifyListeners();
        }
      });
    });
  }

  Future<void> getDataFromApi() async {
    var url = Uri.parse(
        'http://api.aladhan.com/v1/calendar?latitude=$_lat&longitude=$_long&method=4');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Loading from API');

      final data = jsonDecode(response.body) as Map;
      // print(data['data'].length);
      var main = data['data'];
      List<PrayerTime> _fetched = [];

      DateTime? getFajrTime(int x) {
        int hr =
            int.parse(main[x]['timings']['Fajr'].split(' (')[0].split(':')[0]);
        int min =
            int.parse(main[x]['timings']['Fajr'].split(' (')[0].split(':')[1]);

        return DateTime(now!.year, now!.month, x + 1, hr, min);
      }

      DateTime? getDuhurTime(int x) {
        int hr =
            int.parse(main[x]['timings']['Dhuhr'].split(' (')[0].split(':')[0]);
        int min =
            int.parse(main[x]['timings']['Dhuhr'].split(' (')[0].split(':')[1]);

        return DateTime(now!.year, now!.month, x + 1, hr, min);
      }

      DateTime? getAsrTime(int x) {
        int hr =
            int.parse(main[x]['timings']['Asr'].split(' (')[0].split(':')[0]);
        int min =
            int.parse(main[x]['timings']['Asr'].split(' (')[0].split(':')[1]);

        return DateTime(now!.year, now!.month, x + 1, hr, min);
      }

      DateTime? getMaghripTime(int x) {
        int hr = int.parse(
            main[x]['timings']['Maghrib'].split(' (')[0].split(':')[0]);
        int min = int.parse(
            main[x]['timings']['Maghrib'].split(' (')[0].split(':')[1]);

        return DateTime(now!.year, now!.month, x + 1, hr, min);
      }

      DateTime? getIshaTime(int x) {
        int hr =
            int.parse(main[x]['timings']['Isha'].split(' (')[0].split(':')[0]);
        int min =
            int.parse(main[x]['timings']['Isha'].split(' (')[0].split(':')[1]);

        return DateTime(now!.year, now!.month, x + 1, hr, min);
      }

      for (int i = 0; i < data['data'].length; i++) {
        _fetched.add(PrayerTime(
            id: main[i]['date']['gregorian']['day'],
            date: main[i]['date']['gregorian']['date'],
            fajr: main[i]['timings']['Fajr'],
            sunrise: main[i]['timings']['Sunrise'],
            duhur: main[i]['timings']['Dhuhr'],
            asr: main[i]['timings']['Asr'],
            sunset: main[i]['timings']['Sunset'],
            maghrep: main[i]['timings']['Maghrib'],
            isha: main[i]['timings']['Isha'],
            fajrTime: getFajrTime(i),
            duhurTime: getDuhurTime(i),
            asrTime: getAsrTime(i),
            maghripTime: getMaghripTime(i),
            ishaTime: getIshaTime(i)));
      }
      _prayerTimes = _fetched;
      // print(_prayerTimes[0].fajrTime);
      // print(_prayerTimes[0].duhurTime);
      // print(_prayerTimes[0].asrTime);
      // print(_prayerTimes[0].maghripTime);
      // print(_prayerTimes[0].ishaTime);

      // print(main[1]['date']['gregorian']['date']);
    } else {
      throw Exception(response.body);
    }

    for (int i = 0; i < _prayerTimes.length; i++) {
      await DBHelper.insertToDB('prayer_times', {
        'id': _prayerTimes[i].id,
        'date': _prayerTimes[i].date,
        'sunrise': _prayerTimes[i].sunrise,
        'fajr': _prayerTimes[i].fajr,
        'duhur': _prayerTimes[i].duhur,
        'asr': _prayerTimes[i].asr,
        'sunset': _prayerTimes[i].sunset,
        'maghrep': _prayerTimes[i].maghrep,
        'isha': _prayerTimes[i].isha,
        'fajrTime': _prayerTimes[i].fajrTime!.toIso8601String(),
        'duhurTime': _prayerTimes[i].duhurTime!.toIso8601String(),
        'asrTime': _prayerTimes[i].asrTime!.toIso8601String(),
        'maghrepTime': _prayerTimes[i].maghripTime!.toIso8601String(),
        'ishaTime': _prayerTimes[i].ishaTime!.toIso8601String(),
      });
    }
    notifyListeners();
  }

  PrayerTime getByDay(String date) {
    return _prayerTimes.firstWhere((element) => element.date == date);
  }

  AndroidInitializationSettings? androidInitializationSettings;
  IOSInitializationSettings? iosInitializationSettings;
  InitializationSettings? initializationSettings;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializingNotifications() async {
    androidInitializationSettings =
        const AndroidInitializationSettings('ic_launcher');
    iosInitializationSettings = const IOSInitializationSettings();
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings!,
        onSelectNotification: (String? payLoad) {
      //
    });
    notifyListeners();
  }

  // Future<void> showNotification(int id, String? title, String? body,
  //     DateTime? scheduledDate, DateTime? dt) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       const AndroidNotificationDetails(
  //     'channelId',
  //     'channelName',
  //     playSound: true,
  //     importance: Importance.high,
  //     priority: Priority.max,
  //     visibility: NotificationVisibility.public,
  //     sound: RawResourceAndroidNotificationSound('a'),
  //   );
  //   IOSNotificationDetails iosNotificationDetails =
  //       const IOSNotificationDetails();
  //   NotificationDetails notificationDetails = NotificationDetails(
  //       android: androidNotificationDetails, iOS: iosNotificationDetails);
  //   // ignore: deprecated_member_use
  //   await flutterLocalNotificationsPlugin.schedule(
  //       id, title, body, scheduledDate!, notificationDetails,
  //       androidAllowWhileIdle: true);
  //   if (scheduledDate.isBefore(dt!)) {
  //     await flutterLocalNotificationsPlugin.cancel(id);
  //   }
  //   notifyListeners();
  //   // await flutterLocalNotificationsPlugin.cancel(id);
  // }

}
