import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Fire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FireState();
  }
}

class _FireState extends State<Fire> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  TextEditingController locController = TextEditingController();
  TextEditingController reqController = TextEditingController();
  String userUid;

  void getUserUid() {
    User myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser.uid;
  }

  void send() async {
    await FirebaseFirestore.instance
        .collection('locationData')
        .doc(userUid)
        .set({
      "Location": locController.text,
      "request": reqController.text,
    }).whenComplete(() {
      Future<void> _showMyDialog() async {
        return showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Request sent'),
                content: Text('Response on the way'),
                actions: [
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      }
    });
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("lib/assets/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambulance'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,
            markers: Set.of((marker != null) ? [marker] : []),
            circles: Set.of((circle != null) ? [circle] : []),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: locController,
                decoration: InputDecoration(
                  icon: Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Location",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 105.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: reqController,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  icon: Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.local_taxi,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Emergency",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 105.0,
            right: 15.0,
            left: 15.0,
            child: FlatButton(
              child: Text(
                'Send Request',
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
              onPressed: () {
                send();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
    );
  }
}
