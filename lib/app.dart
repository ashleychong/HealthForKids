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
        primaryColor: Color(0xFF3EB16F),//Colors.green[700],
        accentColor: Color.fromRGBO(100, 182, 127, 1),
        fontFamily: 'Monotserrat',
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Theme.of(context).primaryColor,
        ),
      ),
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
