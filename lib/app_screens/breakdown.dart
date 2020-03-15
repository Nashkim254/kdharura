import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Breakdown extends StatefulWidget{
  final String title;
  Breakdown(breakdown, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BreakdownState();
  }
}

class _BreakdownState extends State <Breakdown> {
  GoogleMapController mapController;
  bool mapToggle = false;
  var currentLocation;
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.cyanAccent
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Car Breakdown'),

        ),
        body:  Column(
            children: <Widget>[
              Stack(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height - 80.0,
                        width: double.infinity,
                        child: mapToggle
                            ? GoogleMap(
                            onMapCreated: onMapCreated,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(currentLocation.latitude, currentLocation.longitude),
                                zoom: 10.0)
                        )
                            : Center(
                            child: Text(
                              'Loading.. Please wait..',
                              style: TextStyle(fontSize: 20.0),
                            ))),
                  ]
              ),
            ]
        )
      )
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}