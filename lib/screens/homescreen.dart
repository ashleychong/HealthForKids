import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_for_kids/screens/tips_screen.dart';
import 'package:health_for_kids/widgets/preview_card.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:health_for_kids/screens/info_screen.dart';
import 'package:health_for_kids/data/clinic_data.dart' as locations;
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:location/location.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:health_for_kids/screens/reminder.dart';

class Homescreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  locations.Office _office;
  bool _showPreview = false;
  final Map<String, Marker> _markers = {};
  int currentPage = 0;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    var location = Location();
    if (!await location.hasPermission()) {
      await location.requestPermission();
    }
    await location.changeSettings(
      accuracy: LocationAccuracy.HIGH,
      distanceFilter: 0,
      interval: 100,
    );
    location.onLocationChanged().listen((LocationData currentLocation) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 13,
      )));
    });

    final googleOffices = await locations.getClinics(context);
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.long),
//            infoWindow: InfoWindow(
//              title: office.name,
//              snippet: office.address,
//            ),
            onTap: () => _onMarkerTap(office));
        _markers[office.name] = marker;
      }
    });
  }

  void _onMarkerTap(locations.Office office) {
    _office = office;
    setState(() {
      _showPreview = true;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Health For Kids',
                  style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.6))),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getTab(currentPage),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).primaryColor,
          backgroundColor: Colors.white, //Theme.of(context).accentColor,
          buttonBackgroundColor: Colors.white, //Theme.of(context).accentColor,
          items: [
            Icon(
              Icons.explore,
            ),
            Icon(
              Icons.info,
            ),
            Icon(
              Icons.list,
            ),
            Icon(
              Icons.calendar_today,
            ),
            Icon(
              Icons.forum,
            ),
          ],
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
//    bottomNavigationBar: FancyBottomNavigation(
//      tabs: [
//        TabData(
//          iconData: Icons.map,
//          title: 'Clinics',
//        ),
//        TabData(
//          iconData: Icons.info,
//          title: 'Info',
//        ),
//        TabData(
//          iconData: Icons.list,
//          title: 'Tips',
//        ),
////          TabData(
////            iconData: Icons.calendar_today,
////            title: 'Reminder',
////          ),
//        TabData(
//          iconData: Icons.forum,
//          title: 'Forum',
//        ),
//      ],
//      onTabChangedListener: (position) {
//        setState(() {
//          currentPage = position;
//        });
//      },
//    )
      );

  Widget _getTab(int page) {
    List<Widget> pages = <Widget>[
      _buildMap(context),
      InfoScreen(),
      TipsScreen(),
      MedicineReminder(),
      _buildForumWebView(),
    ];
    return pages[page];
  }

  Stack _buildMap(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(4.1412, 102.18653),
            zoom: 7,
          ),
          markers: _markers.values.toSet(),
          gestureRecognizers: Set()
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          onTap: (LatLng a) {
            _office = null;
            setState(() {
              _showPreview = false;
            });
          },
        ),
        Positioned(
          child: (_showPreview & (_office != null))
              ? PreviewCard(_office)
              : Center(),
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
        )
      ],
    );
  }

  WebView _buildForumWebView() {
    return WebView(
      key: UniqueKey(),
      initialUrl: 'https://host.jiuntian.com',
      javascriptMode: JavascriptMode.unrestricted,
      gestureRecognizers: Set()
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer())),
    );
  }
}
