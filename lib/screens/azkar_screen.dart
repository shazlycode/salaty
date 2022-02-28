import 'package:flutter/material.dart';
import 'package:salaty/screens/share_screen.dart';
import 'package:salaty/widgets/zikr_widget.dart';
import 'package:screenshot/screenshot.dart';

class AzkarScreen extends StatefulWidget {
  static const String id = 'azkar_screen';
  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  String textToBeShared = '';
  ScreenshotController? sSController;
  shareText(String text, ScreenshotController _screenshotController) async {
    textToBeShared = text;
    sSController = _screenshotController;
    // ignore: avoid_print
    print(textToBeShared);
  }

  double textSize = 20;
  @override
  Widget build(BuildContext context) {
    final _isAzkarSabah = ModalRoute.of(context)!.settings.arguments as bool;
    print(_isAzkarSabah);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          _isAzkarSabah == true
              ? Text(
                  'أذكار الصبــــاح',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )
              : Text(
                  'أذكار المســــاء',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
          Expanded(
            child: _isAzkarSabah == true
                ? PageView(
                    reverse: true,
                    children: [
                      ZekrWidget(1, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(2, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(3, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(4, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(5, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(6, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(8, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(9, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(10, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(11, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(12, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(13, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(14, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(15, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(16, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(17, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(18, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(19, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(20, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(21, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(22, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(23, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(24, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(25, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(26, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(27, textSize, _isAzkarSabah, shareText),
                    ],
                  )
                : PageView(
                    reverse: true,
                    children: [
                      ZekrWidget(1, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(2, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(3, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(4, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(5, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(6, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(8, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(9, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(10, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(11, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(12, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(13, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(14, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(15, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(16, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(17, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(18, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(19, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(20, textSize, _isAzkarSabah, shareText),
                      ZekrWidget(21, textSize, _isAzkarSabah, shareText),
                    ],
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Image(
                  width: 50,
                  image: AssetImage('assets/images/share.png'),
                ),
                onTap: () async {
                  Navigator.pushNamed(context, ShareScreen.id,
                      arguments: textToBeShared);
                  // Share.share(textToBeShared + '\n\nتم النشر من تطبيق المؤذن',
                  //     subject: 'تم النشر من تطبيق المؤذن');
                  // final imageFile = await sSController.capture();
                  // await Share.shareFiles([imageFile.path],
                  //     text: 'تم النشر من تطبيق المؤذن');
                },
              ),
              GestureDetector(
                child: Image(
                  width: 50,
                  image: AssetImage('assets/images/increase.png'),
                ),
                onTap: () {
                  setState(() {
                    textSize += 2;
                  });
                },
              ),
              GestureDetector(
                child: Image(
                  width: 50,
                  image: AssetImage('assets/images/decrease.png'),
                ),
                onTap: () {
                  setState(() {
                    textSize += -2;
                  });
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
