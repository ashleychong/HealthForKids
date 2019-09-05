import 'package:flutter/material.dart';
import 'package:health_for_kids/data/clinic_data.dart';

class PreviewCard extends StatelessWidget {
  final Office office;

  PreviewCard(this.office);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPreviewCardTap(context, this.office),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13.0)),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.teal[500], Colors.tealAccent[100]],
                          stops: [0.0, 1.0]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13.0),
                          topRight: Radius.circular(13.0))),
                  child: ListTile(
                    title: Center(
                        child: Text(
                      this.office.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                )),
            ListTile(
              title: Text(
                _fullAddress(),
                style: TextStyle(fontSize: 14.0),
              ),
              leading: Icon(Icons.location_on),
            ),
            ListTile(
              title: Text(this.office.phone),
              leading: Icon(Icons.call),
            )
          ],
        ),
      ),
    );
  }

  String _fullAddress() {
    return office.address + ('\n') + office.district + ('\n') + office.state;
  }

  void _onPreviewCardTap(BuildContext context, Office office) {
    Navigator.pushNamed(context, '/previewScreen',
        arguments: <String, Office>{'office': office});
  }
}
