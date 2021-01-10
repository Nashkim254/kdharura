
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final DocumentReference documentReference =
  FirebaseFirestore.instance.doc('feedback/myfeedback');
  TextEditingController titleController = TextEditingController();
  TextEditingController feedController = TextEditingController();
  String title;
  String feedback;

  void _addFeed() {
    Map<String, String> feed = <String, String>{
      "title": titleController.text,
      "message": feedController.text,
    };
    documentReference.set(feed).whenComplete(() {
      print('document added');
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Feedback'),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  maxLines: 5,
                  controller: feedController,
                  decoration: InputDecoration(
                    labelText: 'Feedback',
                    hintText: 'Feedback here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      feedback = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  onPressed: () {
                    if (titleController.text != "") {
                      _addFeed();
                    }
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Feedback submitted!'),
                      ),
                    );
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  ),
                  splashColor: Theme
                      .of(context)
                      .accentColor,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}