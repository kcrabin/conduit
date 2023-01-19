import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class GetAllArticleRemoteDataSource {
  Future<dynamic> getAllArticles();
}

class GetAllArticleRemoteDataSourceImpl implements GetAllArticleRemoteDataSource {
  final Dio dio;

  GetAllArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future getAllArticles() {
    return dio.get("${ApiConstants.baseUrl}${ApiConstants.articles}");
  }
}
