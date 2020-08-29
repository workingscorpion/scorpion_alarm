import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/model/alarmModel.dart';
import 'package:intl/intl.Dart';

class AlarmItem extends StatelessWidget {
  AlarmItem(this.alarm);

  AlarmModel alarm;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/icons/chicken.png'),
      title: Text('${DateFormat("kk:mm").format(alarm.alarmTime).toString()}'),
    );
  }
}
