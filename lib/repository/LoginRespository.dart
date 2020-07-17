import 'package:neostore/models/login_model.dart';
import 'package:neostore/networking/ApiProvider.dart';


class LoginRespository{
  ApiProvider _provider = ApiProvider();

  Future<LoginResponse> loginUser(String email,String password) async {
    final response = await _provider.login(
      email, password );
    return LoginResponse.fromJson(response);
   
  }
 
}