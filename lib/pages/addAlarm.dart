import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.Dart';
import 'package:scorpion_alarm_app/constants/prefKeys.dart';
import 'package:scorpion_alarm_app/model/alarmModel.dart';
import 'package:scorpion_alarm_app/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAlarmPage extends StatefulWidget {
  AddAlarmPage({Key key}) : super(key: key);

  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  DateTime _dateTime = DateTime.now();
  int diffHours = 0;
  int diffMinutes = 0;
  AlarmModel newAlarm = AlarmModel();

  setDateTimeState(DateTime date) {
    setState(() {
      _dateTime = date;
    });
    setDiffs();
  }

  Future saveAlarm() async {
    newAlarm = AlarmModel(
      alarmTime: _dateTime,
      // int alarmDate; //요일
      // bool vibrate; //진동여부
      // bool sound; //소리 여부
      // int loudness; //소리 크기
      // int bellIndex; //벨 종류
      // int colorIndex; //색깔 종류
      // String alarmMemo; //메모
      // bool isWork;
    );
    final prefs = await SharedPreferences.getInstance();
    var alarmList = prefs.getStringList(PrefKeys.AlarmList);
    if (alarmList == null) {
      alarmList = List();
    }
    alarmList.add(json.encode(newAlarm.toJson()));
    prefs.setStringList(PrefKeys.AlarmList, alarmList);
    Router.toHome();
  }

  setDiffs() {
    setState(() {
      final diviedValue = (_dateTime.difference(DateTime.now()).inMinutes -
              _dateTime.difference(DateTime.now()).inHours * 60 +
              1) /
          60;
      final remainder = (_dateTime.difference(DateTime.now()).inMinutes -
              _dateTime.difference(DateTime.now()).inHours * 60 +
              1) %
          60;

      if (diviedValue >= 1.0) {
        diffHours = _dateTime.difference(DateTime.now()).inHours + 1;
      } else {
        diffHours = _dateTime.difference(DateTime.now()).inHours;
      }
      diffMinutes = remainder;

      //TODO: 마이너스 처리
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('알람 수정'),
          actions: <Widget>[Icon(Icons.delete)],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: Row(
                      children: <Widget>[
                        Text('알람게임'),
                        Image.asset('assets/icons/chicken.png')
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('알람시간'),
                            Text(
                                '${diffHours.toString()}시간 ${diffMinutes.toString()}분 후 알람이 울립니다.')
                          ],
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Text(
                                '${DateFormat("kk:mm").format(_dateTime).toString()}'),
                            RaisedButton(
                              child: Text('시간 설정'),
                              onPressed: () {
                                DatePicker.showTime12hPicker(
                                  context,
                                  showTitleActions: true,
                                  onChanged: (date) {
                                    setDateTimeState(date);
                                  },
                                  onConfirm: (date) {
                                    setDateTimeState(date);
                                  },
                                  currentTime: _dateTime,
                                  locale: LocaleType.ko,
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(child: Text('알람반복')
                      // DaysWidget(),
                      // Row(children: <Widget>[

                      // ],),)
                      ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                child: RaisedButton(
                  child: Text('저장'),
                  onPressed: saveAlarm,
                  color: Colors.yellow,
                ),
              ),
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
            )
          ],
        ));
  }
}
