import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scorpion_alarm_app/constants/customColors.dart';
import 'package:scorpion_alarm_app/pages/home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  Future load() async {
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, moveToHome);
  }

  Future moveToHome() async {
    routeToHome();
  }

  routeToHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColors.primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Image.asset('assets/splash/splash.png'),
              ),
              Container(
                child: Text(
                  '따 : 봉',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          )),
        ));
  }
}
