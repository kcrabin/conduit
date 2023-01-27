import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';
import '../../model/request/post_article_model.dart';

abstract class AddNewArticleRemoteDataSource {
  Future<dynamic> addNewArticle(PostArticleRequest postArticle);
}

class AddNewArticleRemoteDataSourceImpl
    implements AddNewArticleRemoteDataSource {
  final Dio dio;

  AddNewArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future addNewArticle(PostArticleRequest postArticle) async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   compact: false,
    // )
    // );

    return dio.post("${ApiConstants.baseUrl}${ApiConstants.articles}",
        data: postArticle.toJson(),
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
