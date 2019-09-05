import 'package:flutter/material.dart';
import 'package:health_for_kids/data/clinic_data.dart';

class PreviewCard extends StatelessWidget {
  final Office office;

  PreviewCard(this.office);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _onPreviewCardTap(context, this.office),
        child: Card(
            child: Column(
          children: <Widget>[
            ListTile(
              title: Text(this.office.name),
              leading: Icon(Icons.local_pharmacy),
            ),
            Divider(),
            ListTile(
              title: Text(this.office.address),
              leading: Icon(Icons.location_on),
            ),
            ListTile(
              title: Text(this.office.phone),
              leading: Icon(Icons.call),
            )
          ],
        )));
  }

  void _onPreviewCardTap(BuildContext context, Office office) {
    Navigator.pushNamed(context, '/previewScreen',
        arguments: <String, Office>{'office': office});
  }
}
