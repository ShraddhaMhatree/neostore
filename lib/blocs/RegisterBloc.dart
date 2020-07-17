import 'package:neostore/interfaces/LoginCallInterface.dart';
import 'package:neostore/interfaces/RegisterlInterface.dart';
import 'package:neostore/providers/auth_provider.dart';
import 'package:neostore/repository/RegisterationRespository.dart';

class RegisterBloc{
AuthProvider authProvider  = AuthProvider();
RegisterInterface registerInterface;
RegisterationRespository repository = RegisterationRespository();

RegisterBloc(RegisterInterface registerInterface){
  this.registerInterface = registerInterface;
}

void register(String firstName , String lastName,String email,String password,  String confirmPassword, String gender , int phone)
async{
  // if (firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty && password.isNotEmpty &&
  // confirmPassword.isNotEmpty && gender.isNotEmpty && phone.isNegative ) {
    // authProvider.register(firstName,lastName, email, password,confirmPassword,gender,phone).then((response)  {
    //   print(response.body);
    //   if(response.statusCode == 200){
    //         registerInterface.registerSuccess("success");
    //   }else {
    //     registerInterface.registerFailed(response.body);
    //   }
    // });
  
    try{
        final response = await repository.registerUser(firstName, lastName, email, password, confirmPassword, gender, phone);
        registerInterface.registerSuccess(response.data);
    }catch(e){
      registerInterface.registerFailed(e.toString());
  }
  
    
  // }


    

}

}