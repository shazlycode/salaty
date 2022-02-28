import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/prayers_provider.dart';
import 'package:salaty/screens/main_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<PrayerTimesProvider>(context, listen: false)
          .fetchAndSetPrayerTimes()
          .then((value) => Navigator.popAndPushNamed(context, MainScreen.id));
    }
    setState(() {
      _isLoading = false;
    });

    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
          ),
          if (_isLoading)
            Positioned(top: 200, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
