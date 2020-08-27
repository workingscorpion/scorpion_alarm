import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddAlarmPage extends StatefulWidget {
  AddAlarmPage({Key key}) : super(key: key);

  @override
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('알람시간'),
                    Text('11시간 25분 후 알람이 울립니다.') //TODO: 시간 계산
                  ],
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true,

                          // minTime: DateTime(2018, 3, 5),
                          // maxTime: DateTime(2019, 6, 7),
                          onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.ko);
                    },
                    child: Text(
                      'show date time picker (Korean)',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
