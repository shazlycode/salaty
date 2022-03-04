import 'dart:async';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/moazen_provider.dart';
import 'package:salaty/providers/prayers_provider.dart';
import 'package:salaty/screens/azkar_screen.dart';
import 'package:salaty/screens/month.dart';
import 'package:salaty/screens/suras_index.dart';
import 'package:salaty/widgets/extra_item.dart';
import 'package:salaty/widgets/side_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AndroidInitializationSettings? androidInitializationSettings;
  IOSInitializationSettings? iosInitializationSettings;
  InitializationSettings? initializationSettings;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  DateTime? dateTime;
  // DateTime? now = DateTime.now();
  var _isLoading = false;
  String? today = DateFormat('dd-MM-yyyy').format(DateTime.now());
  PrayerTime? todayPrayers;
  DateTime? fajrTime;
  DateTime? duhurTime;
  DateTime? asrTime;
  DateTime? maghrepTime;
  DateTime? ishaTime;
  List<PrayerTime>? monthPrayers;

  @override
  void initState() {
    super.initState();
    initializing();
    // PrayerTimesProvider().initializingNotifications();
    dateTime = DateTime.now();
    Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        dateTime = DateTime.now();
      });
    });

    monthPrayers =
        Provider.of<PrayerTimesProvider>(context, listen: false).prayerTimes;

    _notifyFajr();
    _notifyDuhur();
    _notifyAsr();
    _notifyMaghrip();
    _notifyIsha();

    Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        getRemain();
      });
    });
  }

  Future<void> initializing() async {
    androidInitializationSettings = const AndroidInitializationSettings(
      'ic_launcher',
    );
    iosInitializationSettings = IOSInitializationSettings();
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin!.initialize(initializationSettings!,
        onSelectNotification: (payload) {
      //
    });
  }

  // String sound = 'a';

  Future<void> _notifyFajr() async {
    // await flutterLocalNotificationsPlugin!.cancelAll();

    for (int i = 0; i < monthPrayers!.length; i++) {
      // if (monthPrayers![i].fajrTime!.isBefore(dateTime!)) {
      //   return;
      // } else {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('channelId', 'title',
              importance: Importance.high,
              priority: Priority.max,
              sound: RawResourceAndroidNotificationSound('b'));

      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails();
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);

      // ignore: deprecated_member_use
      await flutterLocalNotificationsPlugin!.schedule(i * 50, 'صلاتـــي',
          'الفجر', monthPrayers![i].fajrTime!, notificationDetails);
      if (monthPrayers![i].fajrTime!.isBefore(dateTime!)) {
        await flutterLocalNotificationsPlugin!.cancel(i * 50);
        // }
      }
    }
  }

  Future<void> _notifyDuhur() async {
    // await flutterLocalNotificationsPlugin!.cancelAll();

    for (int i = 0; i < monthPrayers!.length; i++) {
      // if (monthPrayers![i].duhurTime!.isBefore(dateTime!)) {
      //   return;
      // } else {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('channelId', 'title',
              importance: Importance.high,
              priority: Priority.max,
              sound: RawResourceAndroidNotificationSound('b'));

      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails();
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);

      // ignore: deprecated_member_use
      await flutterLocalNotificationsPlugin!.schedule(i * 150, 'صلاتـــي',
          'الظهر', monthPrayers![i].duhurTime!, notificationDetails);
      if (monthPrayers![i].duhurTime!.isBefore(dateTime!)) {
        await flutterLocalNotificationsPlugin!.cancel(i * 150);
        // }
      }
    }
  }

  Future<void> _notifyAsr() async {
    // await flutterLocalNotificationsPlugin!.cancelAll();

    for (int i = 0; i < monthPrayers!.length; i++) {
      // if (monthPrayers![i].asrTime!.isBefore(dateTime!)) {
      //   return;
      // } else {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('channelId', 'title',
              importance: Importance.high,
              priority: Priority.max,
              sound: RawResourceAndroidNotificationSound('b'));

      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails();
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);

      // ignore: deprecated_member_use
      await flutterLocalNotificationsPlugin!.schedule(i * 200, 'صلاتـــي',
          'العصر', monthPrayers![i].asrTime!, notificationDetails);
      if (monthPrayers![i].asrTime!.isBefore(dateTime!)) {
        await flutterLocalNotificationsPlugin!.cancel(i * 200);
        // }
      }
    }
  }

  Future<void> _notifyMaghrip() async {
    // await flutterLocalNotificationsPlugin!.cancelAll();

    for (int i = 0; i < monthPrayers!.length; i++) {
      // if (monthPrayers![i].maghripTime!.isBefore(dateTime!)) {
      //   return;
      // } else {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('channelId', 'title',
              importance: Importance.high,
              priority: Priority.max,
              sound: RawResourceAndroidNotificationSound('b'));

      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails();
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);

      // ignore: deprecated_member_use
      await flutterLocalNotificationsPlugin!.schedule(i * 250, 'صلاتـــي',
          'المغرب', monthPrayers![i].maghripTime!, notificationDetails);
      if (monthPrayers![i].maghripTime!.isBefore(dateTime!)) {
        await flutterLocalNotificationsPlugin!.cancel(i * 250);
        // }
      }
    }
  }

  Future<void> _notifyIsha() async {
    // await flutterLocalNotificationsPlugin!.cancelAll();

    for (int i = 0; i < monthPrayers!.length; i++) {
      // if (monthPrayers![i].ishaTime!.isBefore(dateTime!)) {
      //   return;
      // } else {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('channelId', 'title',
              importance: Importance.high,
              priority: Priority.max,
              sound: RawResourceAndroidNotificationSound('b'));

      IOSNotificationDetails iosNotificationDetails =
          const IOSNotificationDetails();
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);

      // ignore: deprecated_member_use
      await flutterLocalNotificationsPlugin!.schedule(i * 350, 'صلاتـــي',
          'العشاء', monthPrayers![i].ishaTime!, notificationDetails);
      if (monthPrayers![i].ishaTime!.isBefore(dateTime!)) {
        await flutterLocalNotificationsPlugin!.cancel(i * 350);
        // }
      }
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    setState(() {
      _isLoading = true;
    });
    try {
      todayPrayers = Provider.of<PrayerTimesProvider>(context, listen: false)
          .getByDay(today!);

      // if (now!.isBefore(fajrTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(1, 'Salaty', 'Fajr', fajrTime);
      // } else if (now!.isAfter(fajrTime!) && now!.isBefore(duhurTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(2, 'Salaty', 'Duhur Prayer', duhurTime);
      // } else if (now!.isAfter(duhurTime!) && now!.isBefore(asrTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(3, 'Salaty', 'Asr Prayer', asrTime);
      // } else if (now!.isAfter(asrTime!) && now!.isBefore(maghrepTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(4, 'Salaty', 'Maghrip Prayer', maghrepTime);
      // } else if (now!.isAfter(maghrepTime!) && now!.isBefore(ishaTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(5, 'Salaty', 'Isha Prayer', ishaTime);
      // }

      // var monthPrayers =
      //     Provider.of<PrayerTimesProvider>(context, listen: false).prayerTimes;

      // for (int i = 0; i < monthPrayers.length; i++) {
      //   // if (monthPrayers[i].fajrTime!.isBefore(dateTime!)) {
      //   //   return;
      //   // } else {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(
      //           1 * i, 'Salaty', 'Fajr', monthPrayers[i].fajrTime!, dateTime);
      //   // }

      //   // if (monthPrayers[i].duhurTime!.isBefore(dateTime!)) {
      //   //   return;
      //   // } else {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(2 * i, 'Salaty', 'Duhur Prayer',
      //           monthPrayers[i].duhurTime, dateTime);
      //   // }

      //   // if (monthPrayers[i].asrTime!.isBefore(dateTime!)) {
      //   //   return;
      //   // } else {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(3 * i, 'Salaty', 'Asr Prayer',
      //           monthPrayers[i].asrTime, dateTime);
      //   // }

      //   // if (monthPrayers[i].maghripTime!.isBefore(dateTime!)) {
      //   //   return;
      //   // } else {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(4 * i, 'Salaty', 'Maghrip Prayer',
      //           monthPrayers[i].maghripTime, dateTime);
      //   // }

      //   // if (monthPrayers[i].ishaTime!.isBefore(dateTime!)) {
      //   //   return;
      //   // } else {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(5 * i, 'Salaty', 'Isha Prayer',
      //           monthPrayers[i].ishaTime, dateTime);
      //   // }
      // }

      // if (now!.isBefore(fajrTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(1, 'Salaty', 'Fajr', fajrTime);
      // } else if (now!.isAfter(fajrTime!) && now!.isBefore(duhurTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(2, 'Salaty', 'Duhur Prayer', duhurTime);
      // } else if (now!.isAfter(duhurTime!) && now!.isBefore(asrTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(3, 'Salaty', 'Asr Prayer', asrTime);
      // } else if (now!.isAfter(asrTime!) && now!.isBefore(maghrepTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(4, 'Salaty', 'Maghrip Prayer', maghrepTime);
      // } else if (now!.isAfter(maghrepTime!) && now!.isBefore(ishaTime!)) {
      //   Provider.of<PrayerTimesProvider>(context, listen: false)
      //       .showNotification(5, 'Salaty', 'Isha Prayer', ishaTime);
      // }

    } on Exception catch (err) {
      print(err.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  // getFajrTime() {
  //   int hr = int.parse(todayPrayers!.fajr!.split(' (')[0].split(':')[0]);
  //   int min = int.parse(todayPrayers!.fajr!.split(' (')[0].split(':')[1]);
  //   fajrTime = DateTime(now!.year, now!.month, now!.day, hr, min);
  // }

  // getDuhurTime() {
  //   int hr = int.parse(todayPrayers!.duhur!.split(' (')[0].split(':')[0]);
  //   int min = int.parse(todayPrayers!.duhur!.split(' (')[0].split(':')[1]);
  //   duhurTime = DateTime(now!.year, now!.month, now!.day, hr, min);
  //   print(duhurTime);
  // }

  // getAsrTime() {
  //   int hr = int.parse(todayPrayers!.asr!.split(' (')[0].split(':')[0]);
  //   int min = int.parse(todayPrayers!.asr!.split(' (')[0].split(':')[1]);
  //   asrTime = DateTime(now!.year, now!.month, now!.day, hr, min);
  //   print(asrTime);
  // }

  // getMaghripTime() {
  //   int hr = int.parse(todayPrayers!.maghrep!.split(' (')[0].split(':')[0]);
  //   int min = int.parse(todayPrayers!.maghrep!.split(' (')[0].split(':')[1]);
  //   maghrepTime = DateTime(now!.year, now!.month, now!.day, hr, min);
  //   print(maghrepTime);
  // }
  String? remain = '';
  String? nextP = '';
  void getRemain() {
    if (dateTime!.isBefore(todayPrayers!.fajrTime!)) {
      Duration? t = todayPrayers!.fajrTime!.difference(dateTime!);
      remain = Duration(seconds: t.inSeconds).toString().substring(0, 7);
      // remain = todayPrayers!.fajrTime!.subtract(Duration(
      //     days: dateTime!.day,
      //     hours: dateTime!.hour - 12,
      //     minutes: dateTime!.minute,
      //     seconds: dateTime!.second));
      nextP = 'Fajr';
    } else if (dateTime!.isBefore(todayPrayers!.duhurTime!)) {
      Duration? t = todayPrayers!.duhurTime!.difference(dateTime!);
      remain = Duration(seconds: t.inSeconds).toString().split('.00')[0];
      nextP = 'Duhur';
    } else if (dateTime!.isBefore(todayPrayers!.asrTime!)) {
      Duration? t = todayPrayers!.asrTime!.difference(dateTime!);
      remain = Duration(seconds: t.inSeconds).toString().split('.00')[0];

      nextP = 'Asr';
    } else if (dateTime!.isBefore(todayPrayers!.maghripTime!)) {
      Duration? t = todayPrayers!.maghripTime!.difference(dateTime!);
      remain = Duration(seconds: t.inSeconds).toString().substring(0, 7);
      nextP = 'Maghrip';
    } else if (dateTime!.isBefore(todayPrayers!.ishaTime!)) {
      Duration? t = todayPrayers!.ishaTime!.difference(dateTime!);
      remain = Duration(seconds: t.inSeconds).toString().substring(0, 7);
      nextP = 'Isha';
    }
  }

  // getIshaTime() {
  //   todayPrayers!.isha!.length;
  //   int hr = int.parse(todayPrayers!.isha!.split(' (')[0].split(':')[0]);
  //   int min = int.parse(todayPrayers!.isha!.split(' (')[0].split(':')[1]);
  //   ishaTime = DateTime(now!.year, now!.month, now!.day, hr, min);
  //   print(ishaTime);
  // }
  bool _isAzkarSabah = true;
  var _loadingLoc = false;

  getLocation() async {
    setState(() {
      _loadingLoc = true;
    });
    await context.read<PrayerTimesProvider>().resetLocation();
    setState(() {
      _loadingLoc = false;
    });
  }

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;

  Future<void> launchApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    GlobalKey? _scaffoldKey = GlobalKey<ScaffoldState>();
    final pp = context.watch<PrayerTimesProvider>();
    return Scaffold(
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
                child: Image(
              height: 1000,
              width: MediaQuery.of(context).size.width,
              image: const AssetImage(
                'assets/images/bg.jpg',
              ),
              fit: BoxFit.cover,
            )),
            Positioned(
              top: 40,
              child: Text(DateFormat().add_EEEE().format(dateTime!)),
            ),
            Positioned(
                top: 70,
                child:
                    Text(DateFormat('dd-MM-yyyy').add_jms().format(dateTime!))),
            Positioned(
                top: 95,
                child: Row(
                  children: [
                    GestureDetector(
                      child: _loadingLoc
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : const Icon(
                              Icons.location_on,
                              size: 35,
                              color: Colors.red,
                            ),
                      onTap: () async {
                        print('///////////////');
                        getLocation();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(pp.add1! + ' - ' + pp.add2!),
                  ],
                )),
            Positioned(
                top: 140,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 115, 84, 176),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        Text('Remain to $nextP'),
                        Text(remain!),
                      ],
                    ))),
            _isLoading
                ? CircularProgressIndicator()
                : Positioned(
                    top: 220,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 400,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(.3),
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fajr'),
                              Text(todayPrayers!.fajr!.split(' (')[0])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sunrise'),
                              Text(todayPrayers!.sunrise!.split(' (')[0])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Duhur'),
                              Text(todayPrayers!.duhur!.split(' (')[0])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Asr'),
                              Text(todayPrayers!.asr!.split(' (')[0]),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sunset'),
                              Text(todayPrayers!.sunset!.split(' (')[0])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Maghrib'),
                              Text(todayPrayers!.maghrep!.split(' (')[0])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Isha'),
                              Text(todayPrayers!.isha!.split(' (')[0])
                            ],
                          ),
                        ],
                      ),
                    )),
            Positioned(
              top: 620,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.transparent.withOpacity(.3),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SurasIndex.id);
                          },
                          child: ExtraItem(
                            asset: 'assets/images/quran.png',
                            name: 'الختمة',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AzkarScreen.id,
                                arguments: _isAzkarSabah = true);
                          },
                          child: ExtraItem(
                            asset: 'assets/images/sunrise.png',
                            name: 'اذكار الصباح',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AzkarScreen.id,
                                arguments: _isAzkarSabah = false);
                          },
                          child: ExtraItem(
                            asset: 'assets/images/night.jpg',
                            name: 'اذكار المساء',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Month.id);
                          },
                          child: ExtraItem(
                            asset: 'assets/images/sublimation.jpeg',
                            name: 'اوقات الصلاة لشهر',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await LaunchApp.openApp(
                                androidPackageName: 'com.shazlycode.weather',
                                openStore: true,
                                appStoreLink:
                                    'https://play.google.com/store/apps/details?id=com.shazlycode.weather');
                            // launchApp(
                            //     'https://play.google.com/store/apps/details?id=com.shazlycode.weather');
                          },
                          child: ExtraItem(
                            asset: 'assets/images/weather.png',
                            name: 'درجات الحرارة',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
