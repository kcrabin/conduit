import 'package:dio/dio.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/sp_utils.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class MyArticleRemoteDataSource {
  Future<dynamic> getArticleByUserName(int offset);
}

class MyArticleRemoteDataSourceImpl implements MyArticleRemoteDataSource {
  Dio dio;

  MyArticleRemoteDataSourceImpl({required this.dio});
  @override
  Future getArticleByUserName(int offset) async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    SpUtils spUtils = SpUtils();
    String username = await spUtils.getString(StorageConstants.username);

    return dio.get(
      "${ApiConstants.baseUrl}/articles",
      queryParameters: <String, dynamic>{
        'author': '$username',
        'limit': '20',
        'offset': '$offset'
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
