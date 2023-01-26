import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class FavoriteArticleRemoteDataSource {
  favoriteArticle(String slug);

  unfavoriteArticle(String slug);
}

class FavoriteArticleRemoteDataSourceImpl
    implements FavoriteArticleRemoteDataSource {
  Dio dio;

  FavoriteArticleRemoteDataSourceImpl({required this.dio});

  @override
  favoriteArticle(String slug) async {
    StorageService _storage = StorageService();
    String? token = await _storage.get(StorageConstants.accessToken);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    return dio.post(
        "${ApiConstants.baseUrl}${ApiConstants.articles}/$slug/favorite",
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }

  @override
  unfavoriteArticle(String slug) async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    return dio.delete(
        "${ApiConstants.baseUrl}${ApiConstants.articles}/$slug/favorite",
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
