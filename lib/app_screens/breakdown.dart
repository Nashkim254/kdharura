import 'package:flutter/material.dart';
class Breakdown extends StatelessWidget{
  final String title;
  Breakdown(this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.cyanAccent,
        primaryColor: Colors.teal
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
          title: Text('Breakdown'),
        ),
      ),
    );
  }
}