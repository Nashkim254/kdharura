import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final String title;
  Settings(aid, {Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  bool toggleValue =false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.dark,
       primaryColor: Colors.teal,
       accentColor: Colors.cyan,
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
          title: Text('App Settings'),
        ),
        body: ListView(
      children: <Widget>[
      UserAccountsDrawerHeader(
          accountName: Text('Nashon Kimutai'),
      accountEmail: Text('kimutainashon@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Text('N'),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('K'),
        )
      ],
    ),
    Divider(thickness: 5.0,),
    ListTile(
    title: Text('Notification tones'),
    trailing: AnimatedContainer(
      duration: Duration(microseconds: 1000),
      height: 40.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color:  toggleValue ? Colors.greenAccent[100]: Colors.redAccent[100].withOpacity(0.5)
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
              duration: Duration(microseconds: 1000),
            curve: Curves.easeIn,
            top: 3.0,
            left: toggleValue ? 60.0 : 0.0,
            right: toggleValue ? 0.0 : 60.0,
            child: InkWell(
              onTap: (){
                setState((){
                  toggleValue = !toggleValue;
                });
              },
              child: AnimatedSwitcher(
                  duration: Duration(microseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation){
                    return RotationTransition(
                        child:child,turns: animation);
                },
                child: toggleValue ? Icon(Icons.check_circle, color: Colors.green, size: 35.0,
                key: UniqueKey(),
                ) :Icon(Icons.remove_circle_outline, color: Colors.red, size: 35.0,
                  key: UniqueKey(),
                )
              ),
            ),
          )
        ],
      ),
    ),
    ),
        Divider(thickness: 5.0,),
        ListTile(
          title: Text('Brightness'),
          trailing: AnimatedContainer(
            duration: Duration(microseconds: 1000),
            height: 40.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color:  toggleValue ? Colors.greenAccent[100]: Colors.redAccent[100].withOpacity(0.5)
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(microseconds: 1000),
                  curve: Curves.easeIn,
                  top: 3.0,
                  left: toggleValue ? 60.0 : 0.0,
                  right: toggleValue ? 0.0 : 60.0,
                  child: InkWell(
                    onTap: (){
                      setState((){
                        toggleValue = !toggleValue;
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: Duration(microseconds: 1000),
                        transitionBuilder: (Widget child, Animation<double> animation){
                          return RotationTransition(
                              child:child,turns: animation);
                        },
                        child: toggleValue ? Icon(Icons.check_circle, color: Colors.green, size: 35.0,
                          key: UniqueKey(),
                        ) :Icon(Icons.remove_circle_outline, color: Colors.red, size: 35.0,
                          key: UniqueKey(),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(thickness: 5.0,),
        ListTile(
          title: Text('Current Version 1.0'),
                  ),
        Divider(thickness: 5.0,),
        ListTile(
          title: Text('Report Bug'),
          trailing: AnimatedContainer(
            duration: Duration(microseconds: 1000),
            height: 40.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color:  toggleValue ? Colors.greenAccent[100]: Colors.redAccent[100].withOpacity(0.5)
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(microseconds: 1000),
                  curve: Curves.easeIn,
                  top: 3.0,
                  left: toggleValue ? 60.0 : 0.0,
                  right: toggleValue ? 0.0 : 60.0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        toggleValue = !toggleValue;
                      });
                    },

                    child: AnimatedSwitcher(
                        duration: Duration(microseconds: 1000),
                        transitionBuilder: (Widget child, Animation<double> animation){
                          return RotationTransition(
                            child: child, turns: animation);
                        },
                        child: toggleValue ? Icon(Icons.check_circle, color: Colors.green, size: 35.0,
                          key: UniqueKey(),
                        ) :Icon(Icons.remove_circle_outline, color: Colors.red, size: 35.0,
                          key: UniqueKey(),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    ]
    ),
      ),

    );
  }
}
