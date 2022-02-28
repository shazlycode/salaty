import 'package:flutter/material.dart';

class PrayerTimes extends StatelessWidget {
  PrayerTimes({this.prayer, this.time, this.isTime = false});
  final String? prayer;
  final String? time;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(width: 1),
          color: isTime ? Colors.green[300] : Colors.white),
      child: Column(
        children: [
          Text(
            prayer!,
            style: isTime
                ? TextStyle(
                    fontWeight: FontWeight.bold,
                  ).copyWith(color: Colors.black)
                : null,
          ),
          Text(
            time!,
            style: isTime
                ? TextStyle(fontWeight: FontWeight.bold)
                    .copyWith(color: Colors.black)
                : null,
          )
        ],
      ),
    );
  }
}
