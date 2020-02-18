import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final String title;
  Contacts(this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.teal,
        primaryColor: Colors.cyanAccent
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Contacts", style: TextStyle(color: Colors.white),),
        ),
        body: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Email:kdharura@gmail.com', style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.email),
                ),
                Divider(thickness: 5.0,),
                ListTile(
                  title: Text('Telephone:+254724821720', style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.phone),
                ),
                Divider(thickness: 5.0,),
                ListTile(
                  title: Text(
                    'Website: www.kimutainshonwebhostapp.com', style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(Icons.web),
                ),
                Divider(thickness: 5.0,),
                ListTile(
                  title: Text('Cell: 0716367358', style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.call),
                ),
                Divider(thickness: 5.0,),
              ],
            )));
  }
}
