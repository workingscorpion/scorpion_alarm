import 'package:flutter/material.dart';

class SnackBarHelper {
  static const Duration _duration = Duration(seconds: 2);

  static Future show({
    BuildContext context,
    ScaffoldState state,
    String message,
  }) async {
    (state ?? Scaffold.of(context)).hideCurrentSnackBar();
    (state ?? Scaffold.of(context)).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: _duration,
      ),
    );
  }
}
