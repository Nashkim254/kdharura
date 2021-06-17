import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<About> {
  final double _minimumPadding = 5.0;
  var _formKey = GlobalKey<FormState>();
  var _bloodGroup = [
    'Blood Group A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  var _currentItemSelected = 'Blood Group A+';

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController diabeticController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController medicationController = TextEditingController();
  TextEditingController allergyController = TextEditingController();

  final DocumentReference documentReference =
      FirebaseFirestore.instance.doc("medicalHistory/myMedicalHistory");
  String userUid;

  void getUserUid() {
    User myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser.uid;
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
      title: Text("Medical history"),
      content: Text("Added successfully"),
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

  void medicalSubmit() {
    if (_formKey.currentState.validate()) {
      Map<String, String> meddata = <String, String>{
        "allergy": allergyController.text,
        "name": nameController.text,
        "medication": medicationController.text,
        "date": dateController.text,
        "address": addressController.text,
        "diabetis": diabeticController.text
      };
      documentReference.set(meddata).whenComplete(() {
        print('Data added');
        showAlertDialog(context);
      }).catchError((e) {
        print(e);
      });
    } else {
      return null;
    }
  }

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
        title: Text('About Me'),
      ),
      body: Container(
        key: _formKey,
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(),
              validator: (value) =>
                  value.isEmpty ? "Field can\'t be empty" : null,
              decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Your Name e.g Nash',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(),
                    validator: (value) =>
                        value.isEmpty ? "Field can\'t be empty" : null,
                    decoration: InputDecoration(
                        labelText: 'Date',
                        hintText: 'Enter date e.g 23/1/2020',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Container(
                  width: _minimumPadding * 2,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: _bloodGroup.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    value: _currentItemSelected,
                    onChanged: (String newValueSelected) {
                      _onDropdownItemSelected(newValueSelected);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                validator: (value) =>
                    value.isEmpty ? "Field can\'t be empty" : null,
                decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter Address e.g Maseno',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          Container(
            child: Text(
              'Medical History',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.5,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: diabeticController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                validator: (value) =>
                    value.isEmpty ? "Field can\'t be empty" : null,
                decoration: InputDecoration(
                    labelText: 'Diabetic',
                    hintText: 'Enter e.g Yes/No',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: medicationController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                validator: (value) =>
                    value.isEmpty ? "Field can\'t be empty" : null,
                decoration: InputDecoration(
                    labelText: 'Medication',
                    hintText:
                        'Text here e.g Medication details if there is any',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: allergyController,
                keyboardType: TextInputType.text,
                style: TextStyle(),
                validator: (value) =>
                    value.isEmpty ? "Field can\'t be empty" : null,
                decoration: InputDecoration(
                    labelText: 'Allergies',
                    hintText: 'Text here e.g dust',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          Padding(
            padding:
                EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      medicalSubmit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _onDropdownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
