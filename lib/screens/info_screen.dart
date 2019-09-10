import 'package:flutter/material.dart';
import 'package:health_for_kids/model/info.dart';
import 'package:health_for_kids/src/store.dart';
import 'package:health_for_kids/widgets/info_card.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<Info> _allInfoList = getInfo();
  List<Info> _displayList = List<Info>();
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayList.addAll(_allInfoList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        //add some padding to the top and bottom of the column
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: _buildTextField(),
            ),
            Expanded(
              child: GestureDetector(
                //hide soft keyboard as user scrolls
                behavior: HitTestBehavior.opaque,
                onPanDown: (_) => FocusScope.of(context).requestFocus(
                  FocusNode(),
                ),
                child: ListView.builder(
                    itemCount: _displayList.length,
                    //itemBuilder will execute its function for itemCount times
                    itemBuilder: (BuildContext context, int index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.5, horizontal: 8.0),
                          child: InfoCard(
                            info: _displayList[index],
                          ),
                        )),
              ),
            ),
          ],
        ));
  }

  Widget _buildTextField() {
    return TextField(
      onChanged: (query) => _filterSearchResult(query),
      controller: _editingController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => setState(() {
              _editingController.clear();
              _displayList.clear();
              _displayList.addAll(_allInfoList);
            }),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          )),
    );
  }

  void _filterSearchResult(String query) {
    List<Info> result = new List<Info>();
    List<Info> info = getInfo();
    if (query.isNotEmpty) {
      for (int i = 0; i < info.length; i++) {
        String substring = info[i].title; //.split(" ");
        List<String> queries = query.toLowerCase().split(" ");
        //remove "" case when u type "text ", it become ["text", ""],
        //which become a wildcard for ""
        queries.remove("");
        for (int j = 0; j < queries.length; j++) {
          //title is in sentence case, we need perform non-case-sensitive search
          if (substring.toLowerCase().contains(queries[j].toLowerCase())) {
            result.add(info[i]);
            break;
          }
        }
      }
      setState(() {
        _displayList.clear();
        _displayList.addAll(result);
        return;
      });
    } else {
      setState(() {
        _displayList.clear();
        _displayList.addAll(_allInfoList);
      });
    }
  }
}
