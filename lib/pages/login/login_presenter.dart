
import 'package:dharura_app/data/rest_data.dart';
import 'package:dharura_app/models/user.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError (String error);
}
class LoginPagePresenter{
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter (this._view);

  doLogin (String email, String password){
    api
        .login(email, password)
        .then((user)=>_view.onLoginSuccess(user))
        .catchError((onError)=>_view.onLoginError(onError));
  }
}