import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  String title = "";
  String message = "";

  int itemCount = 0;

  //instance of  document referrence
  final DocumentReference documentReference =
      FirebaseFirestore.instance.doc('feedback/myfeedback');

  //streamsubscription

  StreamSubscription<DocumentSnapshot> streamSubscription;

  //method to fetch data fromfirebase

  void fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          title = datasnapshot.data()['title'];
          message = datasnapshot.data()['message'];
        });
      }
    });
  }

  //overriding the initstate

  @override
  void initState() {
    super.initState();
    streamSubscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          title = datasnapshot.data()['title'];
          message = datasnapshot.data()['message'];
        });
      }
    });
  }

  //overriding the dispose method to dispose the subcription

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              fetch();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: title == null
                    ? Container()
                    : Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Card(
                            elevation: 0.8,
                            child: Center(
                              child: Text(
                                'Title:' + '' + title,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: message == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Card(
                            elevation: 0.8,
                            child: Center(
                              child: Text(
                                'Feedback:' + '' + message,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
