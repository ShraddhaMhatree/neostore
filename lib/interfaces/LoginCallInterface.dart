import 'package:neostore/models/login_model.dart';

abstract class LoginCallBackInterface{

  void loginSuccess(User user);
  void loginFailed(String msg);
}