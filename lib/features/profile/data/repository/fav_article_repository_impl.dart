import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/profile/data/source/remote/fav_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/fav_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:conduit/features/profile/data/models/response/fav_article_response_model.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetFavArticlesRepositoryImpl implements GetFavArticlesRepository {
  GetFavArticlesRemoteDataSource favArticleRemoteDataSource;

  GetFavArticlesRepositoryImpl({required this.favArticleRemoteDataSource});

  List<Articles> articleList = [];

  @override
  getFavArticles() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await favArticleRemoteDataSource.getFavArticles();
        var data = jsonDecode(response.toString());
        articleList = data['articles']
            .map<Articles>((e) => Articles.fromJson(e))
            .toList();
        return ApiResponse(data: articleList);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
