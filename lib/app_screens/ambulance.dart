import 'package:flutter/material.dart';
class Ambulance extends StatelessWidget{
  final String title;
  Ambulance(this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.dark,
        accentColor: Colors.cyanAccent
      ),
      home:Scaffold(
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
      ),
    );
  }
}