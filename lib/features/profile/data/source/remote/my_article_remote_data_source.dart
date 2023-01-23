import 'package:dio/dio.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class MyArticleRemoteDataSource {
  Future<dynamic> getArticleByUserName();
}

class MyArticleRemoteDataSourceImpl implements MyArticleRemoteDataSource {
  Dio dio;

  MyArticleRemoteDataSourceImpl({required this.dio});
  @override
  Future getArticleByUserName() async {
    StorageService _storage = StorageService();
    String? token = await _storage.get(StorageConstants.accessToken);
    String username = "rabin";

    return dio.get(
      "${ApiConstants.baseUrl}/articles",
      queryParameters: <String, dynamic>{
        'author': '$username',
      },
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token $token'
        },
      ),
    );
  }
}
