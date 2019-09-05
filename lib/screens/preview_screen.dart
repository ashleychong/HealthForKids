import 'package:flutter/material.dart';
import 'package:health_for_kids/data/clinic_data.dart';

class PreviewScreen extends StatelessWidget {
  final Office office;

  PreviewScreen(this.office);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
            children: <Widget>[
          _titleSection(),
          Divider(),
        ]
              ..add(_textSection(
                  'Alamat', _fullAddress(), Icon(Icons.location_on)))
              ..add(Divider())
              ..add(_textSection('Telefon', office.phone, Icon(Icons.call)))
              ..add(_textSection('Fax', office.fax, Icon(Icons.print)))
              ..add(Divider())
              ..add(_textSection('Pemberian Imunisasi', office.imunisasi,
                  Icon(Icons.local_hospital)))
              ..add(Divider())
              ..add(_textSection('Pemeriksaan Fizikal', office.physical,
                  Icon(Icons.local_hospital)))
              ..add(Divider())
              ..add(_textSection('Pemeriksaan Tahap Perkembangan',
                  office.development, Icon(Icons.local_hospital)))
              ..add(Divider())
              ..add(_textSection('Antropometri', office.antropometri,
                  Icon(Icons.local_hospital)))
              ..add(Divider())
              ..add(_textSection('Khidmat Nasihat', office.consultation,
                  Icon(Icons.local_hospital)))
              ..add(Divider())));
  }

  String _fullAddress() {
    return office.address + ('\n') + office.district + ('\n') + office.state;
  }

  Widget _titleSection() {
    return ListTile(
        title: Text(office.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)));
  }

  Widget _textSection(String contactType, String contact, Widget widget) {
    return ListTile(
      title: Text(contactType),
      subtitle: Text(contact),
      leading: widget,
    );
  }
}
