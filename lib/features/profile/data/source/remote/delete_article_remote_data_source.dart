import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class DeleteArticleRemoteDataSource {
  deleteSelectedArticle(String slug);
}

class DeleteArticleRemoteDataSourceImpl
    implements DeleteArticleRemoteDataSource {
  Dio dio;
  DeleteArticleRemoteDataSourceImpl({required this.dio});

  @override
  deleteSelectedArticle(String slug) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.delete("${ApiConstants.baseUrl}/articles/$slug",
        options: Options(headers: <String, String>{
          'Authorization': 'Token $token',
        }));
  }
}
