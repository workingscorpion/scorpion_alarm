import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/constants/prefKeys.dart';
import 'package:scorpion_alarm_app/model/alarmModel.dart';
import 'package:scorpion_alarm_app/router/router.dart';
import 'package:scorpion_alarm_app/widgets/alarmItem.dart';
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

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      var alarmStrings = prefs.getStringList(PrefKeys.AlarmList);
      if (alarmStrings != null) {
        alarmStrings
            .map((alarm) =>
                alarmList.add(AlarmModel.fromJson(json.decode(alarm))))
            .toList();
      }
    });
  }

  Future removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(PrefKeys.AlarmList);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 80.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'delete',
              onPressed: removeAll,
              child: Icon(Icons.delete),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              heroTag: 'add',
              onPressed: Router.toAdd,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
