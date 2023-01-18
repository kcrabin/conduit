import 'package:conduit/core/data/source/remote/api_constants.dart';
import 'package:conduit/features/auth/data/model/register_model.dart';
import 'package:dio/dio.dart';

abstract class LoginRemoteDataSource {
  Future<dynamic> login(User user);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future login(User user) {
    return dio.post("${ApiConstants.baseUrl}${ApiConstants.login}",
        data: user.toJson(),
        options: Options(headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }));
  }
}
