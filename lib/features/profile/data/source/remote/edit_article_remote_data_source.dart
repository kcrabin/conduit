import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:conduit/features/profile/data/models/request/update_article_request.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class EditArticleRemoteDataSource {
  updateSelectedArticle(String slug, UpdateArticleRequest updateArticleRequest);
}

class EditArticleRemoteDataSourceImpl implements EditArticleRemoteDataSource {
  Dio dio;
  EditArticleRemoteDataSourceImpl({required this.dio});
  @override
  updateSelectedArticle(
      String slug, UpdateArticleRequest updateArticleRequest) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.put("${ApiConstants.baseUrl}/articles/$slug",
        data: updateArticleRequest.toJson(),
        options: Options(headers: <String, String>{
          'Authorization': 'Token $token',
        }));
  }
}
