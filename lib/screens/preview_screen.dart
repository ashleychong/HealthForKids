import 'package:flutter/material.dart';
import 'package:health_for_kids/data/clinic_data.dart';

class PreviewScreen extends StatelessWidget {
  final Office office;

  PreviewScreen(this.office);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _upperView(context),
        Expanded(
          child: _lowerView(),
        )
      ],
    ));
  }

  String _fullAddress() {
    return office.address + ('\n') + office.district + ('\n') + office.state;
  }

  Widget _textSection(String contactType, String contact, Widget widget) {
    return ListTile(
      title: Text(contactType),
      subtitle: Text(contact),
      leading: widget,
    );
  }

  Container _upperView(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                Colors.blue[400],
                Colors.cyan[200],
                Colors.teal[100]
              ],
                      stops: [
                0.0,
                0.3,
                1.0
              ]))),
          Positioned(
              top: 28.0, left: 5.0, child: BackButton(color: Colors.white)),
          Positioned(
              top: 85.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(office.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.8,
                                  fontFamily: 'Uni Sans',
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800))))))
        ],
      ),
      height: 200.0,
    );
  }

  Widget _lowerView() {
    return Stack(children: <Widget>[
      Container(
        color: Colors.grey[200],
      ),
      Positioned(
          top: 15.0,
          left: 15.0,
          bottom: 15.0,
          right: 15.0,
          child: Card(
              elevation: 3.0,
              child: ListView(
                children: <Widget>[]
                  ..add(_textSection(
                      'Address', _fullAddress(), Icon(Icons.location_on)))
                  ..add(Divider())
                  ..add(_textSection('Phone', office.phone, Icon(Icons.call)))
                  ..add(_textSection('Fax', office.fax, Icon(Icons.print)))
                  ..add(Divider())
                  ..add(_textSection('Immmunization',
                      _convert(office.imunisasi), Icon(Icons.local_hospital)))
                  ..add(Divider())
                  ..add(_textSection('Physical Checkup',
                      _convert(office.physical), Icon(Icons.local_hospital)))
                  ..add(Divider())
                  ..add(_textSection('Development Assessment',
                      _convert(office.development), Icon(Icons.local_hospital)))
                  ..add(Divider())
                  ..add(_textSection(
                      'Anthropometry',
                      _convert(office.antropometri),
                      Icon(Icons.local_hospital)))
                  ..add(Divider())
                  ..add(_textSection(
                      'Consultation',
                      _convert(office.consultation),
                      Icon(Icons.local_hospital))),
              )))
    ]);
    //     )
    //   ],
    // );
  }

  String _convert(String toBeChecked) {
    return (toBeChecked == 'Ada' ? 'Available' : toBeChecked);
  }
}
