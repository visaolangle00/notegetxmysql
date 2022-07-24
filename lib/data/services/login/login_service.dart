
import 'package:dio/dio.dart';

import '../dio_manager.dart';
import 'model/login_request_model.dart';
import 'model/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginService {
  Future login(LoginRequestModel registerRequestModel);
}

class LoginServiceImp extends LoginService {
  final Dio _dio;

  LoginServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future login(LoginRequestModel loginRequestModel) async {
    // return await _dio
    //     .post(
    //       "notebook/login.php",
    //       data: loginRequestModel.toJson(),
    //     )
    //     .then((response) => loginResponseModelFromJson(response.data));

    const String _baseUrl = 'http://192.168.1.4/flutter/flutter_notegetx_mini/login.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      //print('Giriş işlemi başarıyla gönderildi');
      //print(response.body);
      //print(loginResponseModelFromJson(response.body));
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}