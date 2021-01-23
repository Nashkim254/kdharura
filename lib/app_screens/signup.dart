import 'package:dharura_app/app_screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final double _minimumPadding = 5.0;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email, _password;

  void _submit() async {
    UserCredential result;
    try {
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      print(result);
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message;
      }
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } catch (error) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
    }
    FirebaseFirestore.instance.collection("User").doc(result.user.uid).set({
      "UserId": result.user.uid,
      "UserEmail": emailController.text,
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.cyan,
            primaryColor: Colors.teal),
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Signup'),
            ),
            key: scaffoldKey,
            body: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: ListView(
                    children: <Widget>[
                      getImageAsset(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: TextFormField(
                          controller: emailController,
                          onSaved: (val) => _email = val,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email cant be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Your Email e.g code@gmail.com',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
                        child: TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "password cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Password cannot be less than 6 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Your Password here:',
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
                              child: RaisedButton(
                                color: Theme.of(context).accentColor,
                                textColor: Theme.of(context).primaryColorDark,
                                child: Text(
                                  'Signup',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: _submit,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  Widget getImageAsset() {
    final _minimumPadding = 5.0;
    AssetImage assetImage = AssetImage('lib/assets/profile.jpg');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}
