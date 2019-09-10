import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:health_for_kids/model/tip.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> with TickerProviderStateMixin {
  CardController controller;
  List<Tip> tips = [
    Tip(
        content: 'Oral and dental health are important at every age.',
        imageURL:
            'https://files.brightside.me/files/news/part_66/665910/8563260-adorable-baby-care-1581281-1545050207-728-fa94c2dee2-1545300601.jpg'),
    Tip(
        content: "Put your baby to bed while they are still awake.",
        imageURL:
            "https://files.brightside.me/files/news/part_66/665910/8563610-ss-1545057676-728-e943e1583d-1545300601.jpg"),
    Tip(
        content: "Music can soothe the most savage baby.",
        imageURL:
            "https://files.brightside.me/files/news/part_66/665910/8563460-music-1831221_640-1545050547-728-f9eab61a90-1545300601.jpg"),
    Tip(
        content: "Don’t give your baby a pacifier before breastfeeding.",
        imageURL:
            "https://files.brightside.me/files/news/part_66/665910/8563260-adorable-baby-care-1581281-1545050207-728-fa94c2dee2-1545300601.jpg"),
    Tip(
        content: "Tickle your baby if you need to wake them up.",
        imageURL:
            "https://live.staticflickr.com/1718/25199814123_b3a39e3718_k.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
//          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.045),
              child: Text('Tips of the Day',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Playfair Display')),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: new TinderSwapCard(
                      orientation: AmassOrientation.BOTTOM,
                      totalNum: tips.length,
                      stackNum: 3,
                      swipeEdge: 4.0,
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: MediaQuery.of(context).size.width * 0.9,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      minHeight: MediaQuery.of(context).size.width * 0.8,
                      cardBuilder: (context, index) => Card(
                            child: _buildCard(index),
                          ),
                      cardController: controller = CardController(),
                      swipeUpdateCallback:
                          (DragUpdateDetails details, Alignment align) {
                        /// Get swiping card's alignment
                        if (align.x < 0) {
                          //Card is LEFT swiping
                        } else if (align.x > 0) {
                          //Card is RIGHT swiping
                        }
                      },
                      swipeCompleteCallback:
                          (CardSwipeOrientation orientation, int index) {
                        /// Get orientation & index of swiped card!
                      }),
                ))
          ]),
    );
  }

  Widget _buildCard(int index) {
    Tip currentTip = tips[index];
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(currentTip.imageURL),
              ),
            ),
          )),
          new Container(
              padding:
                  new EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(currentTip.content,
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Playfair Display',
                        letterSpacing: 0.4,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
