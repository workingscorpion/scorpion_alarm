import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scorpion_alarm_app/router/router.dart';
import 'package:scorpion_alarm_app/stores/navigationStore.dart';

class App extends StatelessWidget {
  App() {
    this.initialize();
  }

  Future<void> initialize() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Crashlytics.instance.enableInDevMode = true;
    // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      onGenerateRoute: Router.generateRoute,
      navigatorKey: NavigationStore.instance.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
