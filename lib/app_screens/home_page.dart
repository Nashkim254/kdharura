import 'package:dharura_app/app_screens/about.dart';
import 'package:dharura_app/app_screens/accident.dart';
import 'package:dharura_app/app_screens/admin_page.dart';
import 'package:dharura_app/app_screens/aid.dart';
import 'package:dharura_app/app_screens/ambulance.dart';
import 'package:dharura_app/app_screens/breakdown.dart';
import 'package:dharura_app/app_screens/contacts.dart';
import 'package:dharura_app/app_screens/fire.dart';
import 'package:dharura_app/app_screens/help.dart';
import 'package:dharura_app/app_screens/location.dart';
import 'package:dharura_app/app_screens/profilescreen.dart';
import 'package:dharura_app/feedback.dart';
import 'package:dharura_app/models/user.dart';
import 'package:dharura_app/provider/userprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

ProductProvider productProvider;

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: e.userImage == null
              ? AssetImage("images/userImage.png")
              : NetworkImage(e.userImage),
        ),
        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
        accountEmail: Text(e.userEmail, style: TextStyle(color: Colors.black)),
      );
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Response App'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Fire()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.hourglass_empty,
                        size: 70.0,
                        color: Colors.redAccent,
                      ),
                      Text('Fire', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Aid()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.font_download,
                        size: 70.0,
                        color: Colors.blue,
                      ),
                      Text('First Aid', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Ambulance()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.airport_shuttle,
                        size: 70.0,
                        color: Colors.greenAccent,
                      ),
                      Text('Ambulance', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Breakdown()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.drive_eta,
                        size: 70.0,
                        color: Colors.greenAccent,
                      ),
                      Text('Breakdown', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Accident()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.queue,
                        size: 70.0,
                        color: Colors.greenAccent,
                      ),
                      Text('Police', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => About()));
                },
                splashColor: Colors.cyanAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 70.0,
                        color: Colors.greenAccent,
                      ),
                      Text('About Me', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Help()));
                },
                splashColor: Colors.tealAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.help_center_outlined,
                        size: 70.0,
                        color: Colors.pinkAccent,
                      ),
                      Text('Help', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Location()));
                },
                splashColor: Colors.tealAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 70.0,
                        color: Colors.green,
                      ),
                      Text('Distress call', style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _buildUserAccountsDrawerHeader(),
            ListTile(
                title: Text('K-Dharura'),
                trailing: Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.pop(context);
                }),
            Divider(),
            ListTile(
              title: Text('Contact us'),
              trailing: Icon(Icons.contacts),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ContactUs()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('ProfileScreen'),
              trailing: Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
            ),
            Divider(),
            ListTile(
                title: Text('Admin Area'),
                trailing: Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminPage()));
                }),
            Divider(),
            ListTile(
              title: Text('Feedback'),
              trailing: Icon(Icons.feedback),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Feeds()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
