import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/source/remote/article_by_tag_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:conduit/features/home/data/model/response/article_by_tag_response.dart';

class ArticleByTagRepositoryImpl implements ArticleByTagRepository {
  ArticleByTagRemoteDataSource articleByTagRemoteDataSource;

  ArticleByTagRepositoryImpl({required this.articleByTagRemoteDataSource});

  List<Articles> articleList = [];

  @override
  getArticlesByTag(String tagName, int limit, int offset) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet == true) {
      try {
        final response = await articleByTagRemoteDataSource.getArticles(
            tagName, limit, offset);
        var data = jsonDecode(response.toString());
        // articleList = data['articles']
        //     .map<Articles>((e) => Articles.fromJson(e))
        //     .toList();

        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
