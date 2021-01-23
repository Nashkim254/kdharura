import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {


  //getting firestore instance
  FirebaseFirestore firestore;



  //Global key for validation
  final formKey = GlobalKey<FormState>();
  


  //textEditing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController passController = TextEditingController();



//method to subit data
  void submit() async{
    UserCredential result;
    if (formKey.currentState.validate()) {
    await  firestore.collection('userData').doc(result.user.uid).set({
        'Name': nameController.text,
        'email': emailController.text,
        'password': passController.text,
        'role': roleController.text
      });
    }
  }

  //build method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.add,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Value cannot be empty';
                  }
                  return '';
                },
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter user name',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Email cant be empty";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return 'Please a valid Email';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "password cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Password cannot be less than 6 characters";
                  }
                  return null;
                },
                controller: passController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'value cannot be empty';
                  }
                  return null;
                },
                controller: roleController,
                decoration: InputDecoration(
                  labelText: 'Role',
                  hintText: 'Enter role here',
                ),
              ),


              //button tosubmit data
              RaisedButton(
                onPressed: submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
