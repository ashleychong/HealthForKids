import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Text(
          'test',
          style: TextStyle(fontSize: 30.0),
        ),
      )),
    );
  }
}
