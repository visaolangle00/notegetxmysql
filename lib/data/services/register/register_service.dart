
import 'package:dio/dio.dart';

import '../dio_manager.dart';
import 'model/register_request_model.dart';
import 'model/register_response_model.dart';

abstract class RegisterService {
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  final Dio _dio;

  RegisterServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequestModel) {
    return _dio
        .post(
      "http://192.168.1.4/flutter/flutter_notegetx_mini/register.php",
      //"flutter/flutter_notegetx_mini/register.php",
      data: registerRequestModel.toJson(),
    )
        .then((response) => registerResponseModelFromJson(response.data));
  }
}