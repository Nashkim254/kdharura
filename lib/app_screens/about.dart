import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String title;

  About(about, {Key key, this.title}) : super(key: key);

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
  void showSnackBar(BuildContext context){
    var snackBar = SnackBar(
      content: Text('instances of the details have been created'),
      action: SnackBarAction(
          label: 'ok',
          onPressed: null),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

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
            title: Text('About Me'),
          ),
          body: Container(
            key: _formKey,
            margin: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
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

                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
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
                    padding:  EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(),
                      validator: (value) =>
                      value.isEmpty ? "Field can\'t be empty" : null,
                      decoration: InputDecoration(
                          labelText: 'Address',
                          hintText: 'Enter Address e.g Maseno',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )
                ),
                Container(
                  child: Text('Medical History',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),textScaleFactor: 1.5,),
                ),
                Padding(
                    padding:  EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(),
                      validator: (value) =>
                      value.isEmpty ? "Field can\'t be empty" : null,
                      decoration: InputDecoration(
                          labelText: 'Diabetic',
                          hintText: 'Enter e.g Yes/No',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )
                ),
                Padding(
                    padding:  EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(),
                      validator: (value) =>
                      value.isEmpty ? "Field can\'t be empty" : null,
                      decoration: InputDecoration(
                          labelText: 'Medication',
                          hintText: 'Text here e.g Medication details if there is any',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )
                ),
                Padding(
                    padding:  EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(),
                      validator: (value) =>
                      value.isEmpty ? "Field can\'t be empty" : null,
                      decoration: InputDecoration(
                          labelText: 'Allergies',
                          hintText: 'Text here e.g dust',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text('Submit',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            showSnackBar(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]
              ),
            ),
          ),
        );
  }

  void _onDropdownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
