import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';
import '../../model/request/register_request_model.dart';

abstract class RegisterRemoteDataSource {
  Future<dynamic> register(RegisterUser user);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final Dio dio;

  RegisterRemoteDataSourceImpl({required this.dio});

  @override
  Future register(RegisterUser user) {
    return dio.post("${ApiConstants.baseUrl}${ApiConstants.register}",
        data: user.toJson(),
        options: Options(headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }));
  }
}
