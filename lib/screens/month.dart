import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/prayers_provider.dart';
import 'package:salaty/widgets/prayer_time.dart';
import 'package:salaty/widgets/side_drawer.dart';

class Month extends StatefulWidget {
  static const String id = 'month';
  const Month({Key? key}) : super(key: key);

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
  // var _isLoading = false;
  // var isInit = true;
  // @override
  // void didChangeDependencies() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   if (isInit) {
  //     try {
  //       Provider.of<PrayerTimesProvider>(context).fetchAndSetPrayerTimes();
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   isInit = false;

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final pTData = Provider.of<PrayerTimesProvider>(context);
    return Scaffold(
      drawer: SideDrawer(),
      body:

          //     Container(
          // padding: EdgeInsets.all(3),
          //   child: Center(
          //     child: Text(
          //       pTData.prayerTimes.length.toString(),
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ),
          // )

          Container(
              padding: EdgeInsets.all(10),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: pTData.prayerTimes.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Text(
                                      pTData.prayerTimes[index].date!
                                          .split('-2')[0],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 60,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Fajr',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          pTData.prayerTimes[index].fajr!
                                              .split(' (')[0],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 60,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Duhur',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          pTData.prayerTimes[index].duhur!
                                              .split(' (')[0],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 60,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Asr',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          pTData.prayerTimes[index].asr!
                                              .split(' (')[0],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 60,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Maghrip',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          pTData.prayerTimes[index].maghrep!
                                              .split(' (')[0],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    height: 60,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        border: Border.all(width: 1)),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Ishaa',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          pTData.prayerTimes[index].isha!
                                              .split(' (')[0],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
