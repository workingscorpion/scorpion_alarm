import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/model/alarmModel.dart';

class AlarmItem extends StatelessWidget {
  AlarmItem(this.alarm);

  AlarmModel alarm;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(''),
      title: Text(''),
    );
  }
}
