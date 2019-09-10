import 'package:flutter/material.dart';
import 'package:health_for_kids/model/info.dart';
import 'package:health_for_kids/screens/info_detail.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  InfoCard({this.info});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
          onTap: () => _onInfoCardTap(context, info.url),
          child: _buildCard(context)),
    );
  }

  void _onInfoCardTap(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  Widget _buildCard(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey)),
            borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          info.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                            height: 80.0,
                            width: 80.0,
                            child: Image.network(
                              info.imageURL,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
                Text(
                  info.author,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
