import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  final baseuRL = 'http://staging.php-dev.in:8844/trainingapp/api/users/';
  Future<http.Response> login(String email, String password) async {
    
    final url = baseuRL + 'login';
    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode(
        {'email': email, 'password': password},
      ),
    );
    // print(json.decode(response.body));
    return response;
  }

  Future<http.Response> register(String firstName, String lastName, String email,
      String password, String confrimPassword, String gender, int phone) async {
    final url = baseuRL + 'register';
    final response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode(
        {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'confirm_password': confrimPassword,
          'gender': gender,
          'phone_no': phone
        },
      ),
    );
    return response;
    // print(json.decode(response.body));
  }
}
