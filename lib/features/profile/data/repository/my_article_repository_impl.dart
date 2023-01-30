import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/source/remote/my_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/my_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/data/source/remote/api_result.dart';
import '../../../../core/data/source/remote/network_exception.dart';

class MyArticleRepositoryImpl implements MyArticleRepository {
  MyArticleRemoteDataSource myArticleRemoteDataSource;

  MyArticleRepositoryImpl({required this.myArticleRemoteDataSource});
  @override
  getMyArticle() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await myArticleRemoteDataSource.getArticleByUserName();
        var data = jsonDecode(response.toString());
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
