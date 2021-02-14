import 'package:dharura_app/app_screens/admin_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dharura_app/app_screens/home_page.dart';
import 'package:dharura_app/app_screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usermanagement {
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return Login();
        }
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Not autherized! You are not an admin!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  authorizeAccess(BuildContext context) {
    var user = auth.currentUser;
    FirebaseFirestore.instance
        .collection('User')
        .where('UserId', isEqualTo: user.uid)
        .get()
        .then((mydocs) {
      if (mydocs.docs[0].exists) {
        if (mydocs.docs[0].data()['UserRole'] == 'admin') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdminPage()));
        } else {
          showAlertDialog(context);
        }
      }
    });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
