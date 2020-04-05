
import 'package:dharura_app/data/database_helper.dart';
import 'package:dharura_app/models/user.dart';
import 'package:dharura_app/pages/login/login_presenter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage(login, {Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final double _minimumPadding = 5.0;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email, _password;
  LoginPagePresenter _presenter;

  _LoginPageState() {
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
          accentColor: Colors.cyan,
          primaryColor: Colors.teal
        ),
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text('Login'),
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
                                child: Text('Login',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: _submit,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Don\'t have an account?',
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text('Signup',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed('/g');
                        },
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
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
    }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;

    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushReplacementNamed("/home_page");
  }
}
  Widget getImageAsset() {
    final _minimumPadding = 5.0;
    AssetImage assetImage = AssetImage('lib/assets/flutter-icon.png');
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


