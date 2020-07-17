import 'package:neostore/models/login_model.dart';

abstract class RegisterInterface{

  void registerSuccess(User user);
  void registerFailed(String msg);
}