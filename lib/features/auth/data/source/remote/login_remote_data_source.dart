import 'package:conduit/core/data/source/remote/api_constants.dart';
import 'package:dio/dio.dart';

import '../../model/request/login_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<dynamic> login(LoginRequest user);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future login(LoginRequest user) {
    return dio.post("${ApiConstants.baseUrl}${ApiConstants.login}",
        data: user.toJson(),
        options: Options(
            headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }));
  }
}
