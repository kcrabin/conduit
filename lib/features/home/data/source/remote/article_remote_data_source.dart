import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class ArticleRemoteDataSource {
  Future<dynamic> getAllArticles();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;

  ArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future getAllArticles() {
    return dio.get("${ApiConstants.baseUrl}${ApiConstants.articles}");
  }
}
