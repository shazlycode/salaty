import 'package:flutter/material.dart';

class ExtraItem extends StatelessWidget {
  final String? asset;
  final String? name;
  ExtraItem({Key? key, this.asset, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            backgroundImage: AssetImage(asset!)),
        Text(name!),
      ],
    );
  }
}
