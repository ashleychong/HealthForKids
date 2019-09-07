import 'package:flutter/material.dart';
import 'package:health_for_kids/screens/homescreen.dart';
import 'package:health_for_kids/screens/preview_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green[700],
          accentColor: Colors.white,
          fontFamily: 'Monotserrat'),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case '/':
          screen = Homescreen();
          break;
        case '/previewScreen':
          screen = PreviewScreen(arguments['office']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
