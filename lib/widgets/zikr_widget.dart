import 'package:salaty/providers/azkar_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:vibration/vibration.dart';

class ZekrWidget extends StatefulWidget {
  final int zekrId;
  final double textSize;
  final bool isAzkarSabah;
  final void Function(String text, ScreenshotController _screenshotController)
      fun;
  ZekrWidget(this.zekrId, this.textSize, this.isAzkarSabah, this.fun);
  @override
  _ZekrWidgetState createState() => _ZekrWidgetState();
}

class _ZekrWidgetState extends State<ZekrWidget> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    print(widget.isAzkarSabah);
    final azkarSabah = Provider.of<ZekrProvider>(context).azkarSabah;
    final azkarMasaa = Provider.of<ZekrProvider>(context).azkarMasaa;
    final zekrItem = widget.isAzkarSabah == true
        ? Provider.of<ZekrProvider>(context).getZekrSabahById(widget.zekrId)
        : Provider.of<ZekrProvider>(context).getZekrMasaaById(widget.zekrId);
    widget.fun(zekrItem.body!, _screenshotController);
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                zekrItem.body!,
                textAlign: TextAlign.right,
                style:
                    TextStyle(fontSize: widget.textSize, color: Colors.black),
              )),
        )),
        Container(
          color: Colors.teal,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: widget.isAzkarSabah
                        ? Text(
                            ' ${azkarSabah.length}/' ' ${zekrItem.id} ',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            ' ${azkarMasaa.length}/' ' ${zekrItem.id} ',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ${zekrItem.noOfRead}' + '  مرة ',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isAzkarSabah == true
                        ? Provider.of<ZekrProvider>(context, listen: false)
                            .increaseZekrSabahCount(widget.zekrId)
                        : Provider.of<ZekrProvider>(context, listen: false)
                            .increaseZekrMasaaCount(widget.zekrId);
                  });
                  if (zekrItem.noOfRead == zekrItem.count) {}
                },
                child: Container(
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: zekrItem.count >= zekrItem.noOfRead!
                          ? Colors.green
                          : Colors.red),
                  child: Text(
                    '${zekrItem.count}',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
