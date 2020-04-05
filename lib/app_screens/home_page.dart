import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePage  extends StatefulWidget{
  static const String routeName='/';
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Response App'),
        elevation: defaultTargetPlatform == TargetPlatform.android? 5.0:0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/a');
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
                      Text('Fire',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/b');
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
                      Text('First Aid',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/c');
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
                      Text('Ambulance',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/d');
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
                      Text('Breakdown',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/e');
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
                      Text('Police',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/f');
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
                      Text('About Me',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/g');
                },
                splashColor: Colors.tealAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        size: 70.0,
                        color: Colors.pinkAccent,
                      ),
                      Text('Signup',style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/h');
                },
                splashColor: Colors.tealAccent,
                child: Center(
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 70.0,
                        color: Colors.green,
                      ),
                      Text('Distress call',style: TextStyle(fontSize: 17.0)),
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
            UserAccountsDrawerHeader(
              accountName: Text('Nashon Kimutai'),
              accountEmail: Text('kimutainashon@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('N'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('K'),
                )
              ],
            ),
            ListTile(
              title: Text('K-Dharura'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              title: Text('Contacts'),
              trailing: Icon(Icons.contacts),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/j");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/k");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Help'),
              trailing: Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/l");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Feedback'),
              trailing: Icon(Icons.feedback),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/m");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Login'),
              trailing: Icon(Icons.person_pin),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/n");
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