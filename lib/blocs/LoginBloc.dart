import 'package:neostore/interfaces/LoginCallInterface.dart';
import 'package:neostore/providers/auth_provider.dart';
import 'package:neostore/repository/LoginRespository.dart';

class LoginBloc {
  LoginCallBackInterface callBackInterface;
  LoginRespository respository = new LoginRespository();

  LoginBloc(LoginCallBackInterface callBackInterface) {
    this.callBackInterface = callBackInterface;
  }

  void login(String email, String password) async {
    // if (email.isNotEmpty && password.isNotEmpty) {
    //   authProvider.login(email, password).then((response)  {
    //     print(response.body);
    //     if(response.statusCode == 200){
    //           // callBackInterface.loginSuccess("success");
    //     }else {
    //       callBackInterface.loginFailed("login failed");
    //     }
    //   });
    // }
    try {
      final response = await respository.loginUser(email, password);
      callBackInterface.loginSuccess(response.data);
    } catch (e) {
      callBackInterface.loginFailed(e.toString());
    }
  }
}
