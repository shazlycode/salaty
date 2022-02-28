import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:share/share.dart';
import 'package:path/path.dart';

class ShareScreen extends StatefulWidget {
  static const String id = 'share_screen';
  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final _screenshotController = ScreenshotController();
  Future<void> _shareScreenShot() async {
    final imageFile = await _screenshotController.capture(pixelRatio: 1.5);

    // await Share.shareFiles(File(imageFile.),
    //     subject: 'مشاركة من تطبيق المؤذن',
    //     text:
    //         'https://play.google.com/store/apps/details?id=com.shazlycode.prayer_times');
  }

  @override
  Widget build(BuildContext context) {
    final textToBeShared = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Screenshot(
                controller: _screenshotController,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      height: MediaQuery.of(context).size.height - 40,
                      image: AssetImage('assets/images/border.png'),
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        top: 200,
                        left: 80,
                        right: 80,
                        child: Text(
                          textToBeShared,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20),
                        )),
                    Positioned(
                        bottom: 80,
                        left: 125,
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 70,
                          height: 70,
                        )),
                    Positioned(
                        bottom: 80,
                        right: 125,
                        child: Image(
                          image: AssetImage(
                              'assets/images/prayer_times_qr_code.png'),
                          width: 70,
                          height: 70,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.share,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await _shareScreenShot();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
