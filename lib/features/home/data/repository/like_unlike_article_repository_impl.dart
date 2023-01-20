import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/source/remote/like_unlike_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/like_unlike_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FavoriteArticleRepositoryImpl implements FavoriteArticleRepository {
  FavoriteArticleRemoteDataSource favoriteArticleRemoteDataSource;

  FavoriteArticleRepositoryImpl(
      {required this.favoriteArticleRemoteDataSource});
  @override
  favoriteArticle(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await favoriteArticleRemoteDataSource.favoriteArticle(slug);
        var data = jsonDecode(response.toString());

        print('this is response form favorite article ----$data');
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }

  @override
  unfavoriteArticle(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await favoriteArticleRemoteDataSource.unfavoriteArticle(slug);
        var data = jsonDecode(response.toString());

        print('this is response form favorite article ----$data');
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
