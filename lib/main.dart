
import 'package:dharura_app/feedback.dart';
import 'package:dharura_app/pages/login/login_page.dart';

import 'package:flutter/material.dart';
import 'app_screens/about.dart';
import 'app_screens/accident.dart';
import 'app_screens/aid.dart';
import 'app_screens/ambulance.dart';
import 'app_screens/breakdown.dart';
import 'app_screens/contacts.dart';
import 'app_screens/fire.dart';
import 'app_screens/help.dart';
import 'app_screens/home_page.dart';
import 'app_screens/location.dart';
import 'app_screens/settings.dart';
import 'app_screens/signup.dart';


void main () => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage('/n'),
      title: 'Emergency Response App',
      theme: ThemeData(
          primaryColor: Colors.tealAccent,
          brightness: Brightness.dark,
          accentColor: Colors.cyanAccent
      ),
      routes:<String, WidgetBuilder>{
        '/login_page':(BuildContext context)=> MyApp(),
        '/home_page':(BuildContext context)=> HomePage(),
        "/a": (BuildContext context) => Fire('fire'),
        '/b': (BuildContext context) => Aid('aid'),
        '/c': (BuildContext context)=> Ambulance('ambulance'),
        '/d': (BuildContext context)=> Breakdown('breakdown'),
        '/e': (BuildContext context)=> Accident ('accident'),
        '/f': (BuildContext context)=> About ('about'),
        '/g': (BuildContext context) => Signup('signup'),
        '/h': (BuildContext context)=> Location ('location'),
        '/j': (BuildContext context) => Contacts('contacts'),
        '/k': (BuildContext context)=> Settings('settings'),
        '/l': (BuildContext context) => Help ('help'),
        '/m': (BuildContext context)=> Feeds('feedback'),
        '/n': (BuildContext context)=> LoginPage ('login')

      },
      initialRoute: '/LoginPage',

    );
  }
}

