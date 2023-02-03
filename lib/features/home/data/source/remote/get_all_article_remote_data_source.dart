import 'package:dio/dio.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class GetAllArticleRemoteDataSource {
  Future<dynamic> getAllArticles(int offset);
}

class GetAllArticleRemoteDataSourceImpl
    implements GetAllArticleRemoteDataSource {
  final Dio dio;

  GetAllArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future getAllArticles(int offset) async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    return dio.get("${ApiConstants.baseUrl}${ApiConstants.articles}",
        queryParameters: <String, dynamic>{'limit': '20', 'offset': '$offset'},
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
