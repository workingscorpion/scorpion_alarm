import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/model/alarmModel.dart';
import 'package:scorpion_alarm_app/router/router.dart';
import 'package:scorpion_alarm_app/widget/alarmItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AlarmModel> alarmList = List();

  @override
  void initState() {
    super.initState();
    load();
  }

  //set
//   SharedPreferences pref = await SharedPreferences.getInstance();
// Map json = jsonDecode(jsonString);
// String user = jsonEncode(UserModel.fromJson(json));
// pref.setString('userData', user);

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      var alarmStrings = prefs.getStringList("alarmTimeList");
      if (alarmStrings == null) {
        alarmStrings = List();
      }
      final List<AlarmModel> alarmMaps =
          alarmStrings.map((alarm) => jsonDecode(alarm)).toList();
      alarmList = alarmMaps;
      // alarmList =
      //     alarmMaps.forEach((alarm) => AlarmModel.fromJson(alarm));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: alarmList.length,
          itemBuilder: (BuildContext context, int index) {
            return AlarmItem(alarmList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: Router.toAdd,
        child: Icon(Icons.add),
      ),
    );
  }
}
