import 'dart:async';
import 'package:dharura_app/models/user.dart';
import 'package:dharura_app/utils/network_util.dart';
class RestData{
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = '';
  static final LOGIN_URL = BASE_URL +'/';
  Future<User> login(String email, String password){
    return new  Future.value(new User(email,password) );
  }
}