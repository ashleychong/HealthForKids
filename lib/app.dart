import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: DefaultTabController(
          //3 tabs
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: const Text('Google Office Locations'),
                backgroundColor: Colors.green[700],
              ),
              body: TabBarView(
                children: <Widget>[
                  _buildMap(),
                  Center(child: Icon(Icons.info)),
                  Center(child: Icon(Icons.forum)),
                ],
                physics: NeverScrollableScrollPhysics(),
              ),
              bottomNavigationBar: TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.map),
                    text: 'Locations',
                  ),
                  Tab(
                    icon: new Icon(Icons.info),
                    text: 'Info',
                  ),
                  Tab(
                    icon: new Icon(Icons.forum),
                    text: 'Forum',
                  ),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blue,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.black,
              )),
        ),
        debugShowCheckedModeBanner: false,
      );

  GoogleMap _buildMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      tiltGesturesEnabled: true,
      scrollGesturesEnabled: true,
      rotateGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
        target: const LatLng(0, 0),
        zoom: 2,
      ),
      markers: _markers.values.toSet(),
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
    );
  }
}
