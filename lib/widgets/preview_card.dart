import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_for_kids/data/clinic_data.dart';
import 'package:url_launcher/url_launcher.dart';

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
              trailing: Icon(Icons.directions, color: Theme.of(context).primaryColor,),
              onTap: () {
                _openMap(this.office.lat, this.office.long);
              }
            ),
            ListTile(
              title: Text(this.office.phone),
              leading: Icon(Icons.call),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
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

  void _openMap(double lat, double long) async {
    // Android
    var url = 'geo:0,0?q=$lat,$long';
    if (Platform.isIOS) {
      // iOS
      url = 'http://maps.apple.com/?q=$lat,$long';
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
