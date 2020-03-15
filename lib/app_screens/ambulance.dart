import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ambulance extends StatefulWidget {
  final String title;

  Ambulance(ambulance, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AmbulanceState();
  }
}

class _AmbulanceState extends State<Ambulance> {
  bool mapToggle = false;
  var currentLocation;
  var clients = [];
  GoogleMapController mapController;

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
        populateClients();
      });
    });
  }

  populateClients() {
    clients = [];
    Firestore.instance.collection('markers').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; ++i) {
          clients.add(docs.documents[i].data);
          // initMarker(docs.documents[i].data);
        }
      }
    });
  }

  /*initMarker(client) {
    mapController.clearMarkers().then((val) {
      mapController.addMarker(MarkerOptions(
          position:
          LatLng(client['location'].latitude, client['location'].longitude),
          draggable: false,
          infoWindowText: InfoWindowText(client['clientName'], 'Nice')));
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.teal, accentColor: Colors.cyanAccent),
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
            body: Column(children: <Widget>[
              Stack(children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height - 80.0,
                    width: double.infinity,
                    child: mapToggle
                        ? GoogleMap(
                            onMapCreated: onMapCreated,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(-0.0067, 34.5985), zoom: 10.0))
                        : Center(
                            child: Text(
                            'Loading.. Please wait..',
                            style: TextStyle(fontSize: 20.0),
                          )
                    ),
                ),
              ]),
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
