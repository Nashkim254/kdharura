import 'package:dharura_app/data/database_helper.dart';
import 'package:dharura_app/models/user.dart';
import 'package:dharura_app/pages/login/login_presenter.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final String title;

  Signup(signup, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final double _minimumPadding = 5.0;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email, _password;
  LoginPagePresenter _presenter;

  _SignupState() {
    _presenter = new LoginPagePresenter(this);
  }
  void _submit(){
    final form =formKey.currentState;
    if (form.validate()){
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }
  void _showSnackBar(String  text){
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
  @override
  Widget build(BuildContext context) {
    _ctx = context;
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
                            top: _minimumPadding,bottom: _minimumPadding),
                        child: TextFormField(
                          onSaved: (val)=>_email=val,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(),
                          validator: (value) =>
                          value.isEmpty ? "Email can\ 't be empty" : null,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Your Email e.g code@gmail.com',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding,bottom: _minimumPadding),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(),
                          validator: (value) =>
                          value.isEmpty ? "Password can\ 't be empty" : null,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Your Password here:',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                color: Theme.of(context).accentColor,
                                textColor: Theme.of(context).primaryColorDark,
                                child: Text('Signup',
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
                )
            )
        )
    );
  }
  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;

    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.pop(context);
  }
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
