import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Fire extends StatefulWidget{
  final String title;
  Fire(fire, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FireState();
  }
}

class _FireState extends State <Fire> {
  GoogleMapController mapController;
  String searchAddr;
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
          title: Text('Fire Brigade'),

        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(target: LatLng(40.7128, -74.0060),zoom: 10.0),
            )
          ],
        ),
      ),
    );
  }

  void onMapCreated( controller) {
    setState(() {
      mapController = controller;
    });
  }
}