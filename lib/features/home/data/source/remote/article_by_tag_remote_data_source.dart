import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class ArticleByTagRemoteDataSource {
  getArticles(String tagName, int limit, int offset);
}

class ArticleByTagRemoteDataSourceImpl implements ArticleByTagRemoteDataSource {
  Dio dio;

  ArticleByTagRemoteDataSourceImpl({required this.dio});
  @override
  getArticles(String tagName, int limit, int offset) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);
    // String tag = 'implementations';

    return dio.get(
      "${ApiConstants.baseUrl}/articles",
      queryParameters: <String, dynamic>{
        'tag': '$tagName',
        'limit': '$limit',
        'offset': '$offset'
      },
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
