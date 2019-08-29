import 'package:flutter/material.dart';
import 'package:health_for_kids/model/info.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  InfoCard({this.info});

  @override
  Widget build(BuildContext context) {
    Container _buildHeader() {
      return Container(
        constraints: BoxConstraints(maxHeight: 200),
        child: Text(info.header,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300)),
      );
    }

    ConstrainedBox _buildTextSection() {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 50),
        child: Text(info.content),
      );
    }

    return GestureDetector(
      child: GestureDetector(
          onTap: () => _onInfoCardTap(context, info.id),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHeader(),
                    SizedBox(height: 10.0),
                    _buildTextSection(),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _onInfoCardTap(BuildContext context, int infoID) {
    print('working');
    Navigator.pushNamed(
      context,
      '/infoDetailScreen',
      arguments: {'id': infoID},
    );
  }
}
