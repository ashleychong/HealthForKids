import 'package:flutter/material.dart';
import 'package:health_for_kids/src/locations.dart';

class PreviewScreen extends StatelessWidget {
  final Office office;

  PreviewScreen(this.office);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
            children: <Widget>[
          Image.network(
            office.image,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _titleSection(),
          Divider(),
        ]
              ..add(_textSection(office.address, Icon(Icons.location_on)))
              ..add(Divider())
              ..add(_textSection(office.phone, Icon(Icons.call)))
              ..add(Divider())));
  }

  Widget _titleSection() {
    return ListTile(
        title: Text(office.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)));
  }

  Widget _textSection(String str, Icon icon) {
    return ListTile(title: Text(str), leading: icon);
  }
}
