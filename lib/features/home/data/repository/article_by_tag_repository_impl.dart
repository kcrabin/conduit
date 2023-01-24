import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/source/remote/article_by_tag_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ArticleByTagRepositoryImpl implements ArticleByTagRepository {
  ArticleByTagRemoteDataSource articleByTagRemoteDataSource;

  ArticleByTagRepositoryImpl({required this.articleByTagRemoteDataSource});
  @override
  getArticlesByTag(String tagName) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    try {
      final response = await articleByTagRemoteDataSource.getArticles(tagName);
      var data = jsonDecode(response.toString());

      return data;
    } on DioError catch (e) {
      CustomException.errorMessage(e);
    }
  }
}
