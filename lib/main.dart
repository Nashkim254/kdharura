import 'package:dharura_app/provider/userprovider.dart';
import 'package:dharura_app/services/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff746bc9),
          iconTheme: IconThemeData(color: Colors.lightBlue),
        ),
        debugShowCheckedModeBanner: false,
        home: Usermanagement().handleAuth(),
      ),
    );
  }
}
