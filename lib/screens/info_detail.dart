import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_for_kids/model/info.dart';
import 'package:health_for_kids/src/store.dart';

class InfoDetail extends StatelessWidget {
  final int _infoID;

  InfoDetail(this._infoID);

  @override
  Widget build(BuildContext context) {
    Info fetchByID(int id) {
      List<Info> list = getInfo();
      for (var i = 0; i < list.length; i++) {
        if (list[i].id == id) {
          return list[i];
        }
      }
      return null;
    }

    Info info = fetchByID(_infoID);

    return Scaffold(
      appBar: AppBar(
          title: Text(info.header,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300))),
      body: Padding(
        child: Text(info.content),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
