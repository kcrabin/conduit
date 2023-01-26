import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class GetSingleArticleBySlugRemoteDataSource {
  getSingleArticle(String slug);
}

class GetSingleArticleBySlugRemoteDataSourceImpl
    implements GetSingleArticleBySlugRemoteDataSource {
  Dio dio;
  GetSingleArticleBySlugRemoteDataSourceImpl({required this.dio});
  @override
  getSingleArticle(String slug) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.get(
      "${ApiConstants.baseUrl}/articles/$slug",
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
