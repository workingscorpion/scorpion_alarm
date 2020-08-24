import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/widget/alarmItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> alarmTimeList = List();
  List<String> alarmNameList = List();

  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      alarmTimeList = prefs.getStringList("alarmTimeList");
      alarmNameList = prefs.getStringList("alarmNameList");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: alarmTimeList.length,
        itemBuilder: (BuildContext context, int index) {
          return AlarmItem(alarmTimeList[index], alarmNameList[index]);
        });
  }
}
