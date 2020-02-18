class User {
  String _email;
  String _password;

  User(this._email, this._password);
  User.fromMapObject(Map<String, dynamic> map){
    this._email= map['email'];
    this._password=map['password'];
  }
  String get email => _email;
  String get password => _password;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['email'] = _email;
    map ['password'] = _password;
    return map;
  }
}