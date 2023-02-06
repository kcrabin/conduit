import 'dart:convert';

import 'package:conduit/features/profile/data/models/response/my_article_response.dart';

import 'package:conduit/features/profile/data/source/remote/my_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/my_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/data/source/remote/api_result.dart';
import '../../../../core/data/source/remote/network_exception.dart';

class MyArticleRepositoryImpl implements MyArticleRepository {
  MyArticleRemoteDataSource myArticleRemoteDataSource;

  MyArticleRepositoryImpl({required this.myArticleRemoteDataSource});
  List<Articles> articleList = [];

  @override
  getMyArticle(int limit, int offset) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await myArticleRemoteDataSource.getArticleByUserName(limit ,offset);
        var data = jsonDecode(response.toString());
        // articleList = data['articles']
        //     .map<Articles>((e) => Articles.fromJson(e))
        //     .toList();
        // print('this is from repository --${data['articles']}');
        return ApiResponse(data: data);
      } on DioError catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
