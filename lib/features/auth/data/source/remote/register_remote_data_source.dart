import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';
import '../../model/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<dynamic> register(User user);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final Dio dio;

  RegisterRemoteDataSourceImpl({required this.dio});

  @override
  Future register(User user) {
    return dio.post("${ApiConstants.baseUrl}${ApiConstants.register}",
        data: user.toJson(),
        options: Options(headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }));
  }
}
