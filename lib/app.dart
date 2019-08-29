import 'package:flutter/material.dart';
import 'package:health_for_kids/screens/homescreen.dart';
import 'package:health_for_kids/screens/info_detail.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      debugShowCheckedModeBanner: false,
    );
  }

  RouteFactory _routes() {
    return (setting) {
      final Map<String, int> arguments = setting.arguments;
      Widget screen;
      switch (setting.name) {
        case '/':
          screen = Homescreen();
          break;
        case '/infoDetailScreen':
          screen = InfoDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
