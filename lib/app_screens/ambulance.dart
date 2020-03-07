import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Ambulance extends StatefulWidget{
  final String title;
  Ambulance(ambulance, {Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AmbulanceState();
  }
}

class _AmbulanceState extends State <Ambulance> {

  GoogleMapController mapController;

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
              title: Text('Ambulance'),

            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
              height: 500.0,
                  width: double.infinity,
                  child: GoogleMap(
                    onMapCreated: (controller){
                      setState(() {
                        mapController = controller;
                      });
                    },
                      initialCameraPosition: CameraPosition(
                          target: LatLng(52.7128, -80.0060),
                          zoom: 5.0
                      )
                  ),
                )
              ],
            )
        )
    );
  }
}