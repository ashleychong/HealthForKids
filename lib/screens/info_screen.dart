import 'package:flutter/material.dart';
import 'package:health_for_kids/model/info.dart';
import 'package:health_for_kids/src/store.dart';
import 'package:health_for_kids/widgets/info_card.dart';

class InfoScreen extends StatelessWidget {
  final List<Info> infoList = getInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
        //add some padding to the top and bottom of the column
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: infoList.length,
                  //itemBuilder will execute its function for itemCount times
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 8.0),
                        child: InfoCard(
                          info: infoList[index],
                        ),
                      )),
            ),
          ],
        ));
  }
}
