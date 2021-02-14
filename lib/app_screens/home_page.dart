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
import 'package:dharura_app/services/usermanagement.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

ProductProvider productProvider;

class _HomePageState extends State<HomePage> {
  double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  MediaQueryData mediaQuery;
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

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Usermanagement().authorizeAccess(context);
            },
            leading: Icon(Icons.person),
            title: Text("Admin page"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                checkoutColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => About()));
            },
            leading: Icon(Icons.help),
            title: Text("About"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                aboutColor = false;
                contactUsColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProfileScreen(),
                ),
              );
            },
            leading: Icon(Icons.info),
            title: Text("Profile"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                checkoutColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ContactUs()));
            },
            leading: Icon(Icons.phone),
            title: Text("Contant Us"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                checkoutColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Feeds()));
            },
            leading: Icon(Icons.book_online_outlined),
            title: Text("Feedback"),
          ),
          ListTile(
            onTap: () {
              Usermanagement().signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  ThemeData lightmode = ThemeData(brightness: Brightness.light);
  ThemeData darkmode = ThemeData(brightness: Brightness.dark);
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _switch ? darkmode : lightmode,
      home: Scaffold(
        key: _key,
        drawer: _buildMyDrawer(),
        appBar: AppBar(
          title: Text(
            'Kdharura',
            style: TextStyle(fontSize: 18.0),
          ),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          actions: [
            Text('Light/Dark mode'),
            Switch(
              value: _switch,
              onChanged: (newVal) {
                setState(() {
                  _switch = newVal;
                });
              },
            ),
          ],
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Ambulance()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Breakdown()));
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
                        Text('About', style: TextStyle(fontSize: 17.0)),
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
      ),
    );
  }
}
