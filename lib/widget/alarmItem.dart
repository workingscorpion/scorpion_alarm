import 'package:flutter/material.dart';

class AlarmItem extends StatelessWidget {
  AlarmItem(this.time, this.name);

  String time;
  String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(''),
      title: Text(''),
    );
  }
}
