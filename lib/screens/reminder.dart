import 'package:flutter/material.dart';
import 'package:health_for_kids/src/global_bloc.dart';
import 'package:health_for_kids/src/reminder_homepage.dart';
import 'package:provider/provider.dart';

class MedicineReminder extends StatefulWidget {
  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
//          primaryColor: Color(0xFF3EB16F),//Colors.green[700],
//          accentColor: Colors.white,
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Theme.of(context).primaryColor,
          ),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
