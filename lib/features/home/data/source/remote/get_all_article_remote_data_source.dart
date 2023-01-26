import 'package:dio/dio.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class GetAllArticleRemoteDataSource {
  Future<dynamic> getAllArticles();
}

class GetAllArticleRemoteDataSourceImpl
    implements GetAllArticleRemoteDataSource {
  final Dio dio;

  GetAllArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future getAllArticles() async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    return dio.get("${ApiConstants.baseUrl}${ApiConstants.articles}",
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
