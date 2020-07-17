import 'package:http/http.dart' as http;
import 'package:neostore/models/login_model.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:neostore/networking/CustomException.dart';

class ApiProvider {
  // final String _baseUrl = "http://staging.php-dev.in:8844/trainingapp/api/";

  final String _baseUrl = "https://testapi.io/api/ShraddhaMhatre/";

  Future<dynamic> registerUser(String firstName, String lastName, String email,
      String password, String confrimPassword, String gender, int phone) async {
    var responseJson;
    final url = _baseUrl + 'users/register';
    try {
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
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic login(String email, String password) async {
    final url = _baseUrl + 'login';
    var responseJson;
    try {
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
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    // print('response ${response.body.toString()}');
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:

        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(LoginResponse.fromJson(responseJson).userMsg);
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());

      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
