import 'package:neostore/models/login_model.dart';
import 'package:neostore/networking/ApiProvider.dart';


class RegisterationRespository{
  ApiProvider _provider = ApiProvider();

  Future<LoginResponse> registerUser(String firstName , String lastName,String email,String password,  String confirmPassword, String gender , int phone) async {
    final response = await _provider.registerUser(
      firstName,lastName, email, password,confirmPassword,gender,phone
    );
    return LoginResponse.fromJson(response);
   
  }
 
}