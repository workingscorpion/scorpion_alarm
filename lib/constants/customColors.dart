import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class CustomColors {
  // static final Color primaryColor =
  //     TinyColor.fromString('##01a7b6').setOpacity(0.25).color;
  static Map<int, Color> colorss = {
    50: Color.fromRGBO(1, 167, 182, .1),
    100: Color.fromRGBO(1, 167, 182, .2),
    200: Color.fromRGBO(1, 167, 182, .3),
    300: Color.fromRGBO(1, 167, 182, .4),
    400: Color.fromRGBO(1, 167, 182, .5),
    500: Color.fromRGBO(1, 167, 182, .6),
    600: Color.fromRGBO(1, 167, 182, .7),
    700: Color.fromRGBO(1, 167, 182, .8),
    750: Color.fromRGBO(1, 167, 182, .75),
    800: Color.fromRGBO(1, 167, 182, .9),
    900: Color.fromRGBO(1, 167, 182, 1),
  };

  static final MaterialColor mainColor = MaterialColor(0xFF01A7B6, colorss);

  static final Color primaryColor = Color.fromRGBO(1, 167, 182, 0.75);
  static final Color textBlack = TinyColor.fromString('#4a4a4a').color;
  static final Color textBrightGrey = TinyColor.fromString('#e0e0e0').color;
  static final Color textGrey = TinyColor.fromString('#bebebe').color;
  static final Color textDarkGrey = TinyColor.fromString('#5e5e5e').color;
  static final Color acceptReject = TinyColor.fromString('#ff283e').color;
  static final Color acceptWait = TinyColor.fromString('#333365').color;
}
