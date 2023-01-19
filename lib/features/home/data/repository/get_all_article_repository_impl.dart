import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/source/remote/get_all_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetAllArticleRepositoryImpl implements GetAllArticleRepository {
  final GetAllArticleRemoteDataSource articleRemoteDataSource;

  GetAllArticleRepositoryImpl({required this.articleRemoteDataSource});

  @override
  getArticleList() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await articleRemoteDataSource.getAllArticles();
        var data = jsonDecode(response.toString());

        // final articleList = data['articles']
        //     .map<Articles>((e) => Articles.fromJson(e))
        //     .toList();
        // final articleList = data['articles'].map<Articles>(Articles).toList();

        // print('this is printed fron article repository-----${articleList}');

        return data;
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
