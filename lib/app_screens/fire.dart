import 'package:flutter/material.dart';

class Fire extends StatefulWidget {
  final String title;

  Fire(fire, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FireState();
  }
}

class _FireState extends State<Fire> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
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
          title: Text('Fire Brigade'),
        ),
      ),
    );
  }
}
