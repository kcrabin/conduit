import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/source/remote/get_single_article_by_slug_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_single_article_by_slug_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetSingleArticleBySlugImpl implements GetSingleArticleBySlug {
  GetSingleArticleBySlugRemoteDataSource getSingleArticleBySlugRemoteDataSource;

  GetSingleArticleBySlugImpl(
      {required this.getSingleArticleBySlugRemoteDataSource});

  @override
  getSingleArticleBySlug(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await getSingleArticleBySlugRemoteDataSource.getSingleArticle(slug);

        var data = jsonDecode(response.toString());
        // print('this is data from repository ${data}');

        // print('this is data from repository ${data['article']['slug']}');

        return data;
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
