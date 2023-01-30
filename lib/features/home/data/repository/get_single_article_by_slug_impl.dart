import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/model/response/single_article_by_slug.dart';
import 'package:conduit/features/home/data/source/remote/get_single_article_by_slug_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_single_article_by_slug_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetSingleArticleBySlugImpl implements GetSingleArticleBySlug {
  GetSingleArticleBySlugRemoteDataSource getSingleArticleBySlugRemoteDataSource;

  GetSingleArticleBySlugImpl(
      {required this.getSingleArticleBySlugRemoteDataSource});

  Article article = Article();
  late SingleArticleBySlug singleArticleBySlug;

  @override
  getSingleArticleBySlug(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await getSingleArticleBySlugRemoteDataSource.getSingleArticle(slug);

        var data = jsonDecode(response.toString());
        singleArticleBySlug = SingleArticleBySlug.fromJson(data);
        article = singleArticleBySlug.article!;
        // print('this is data from repository ${data}');

        // print('this is data from repository ${data['article']['slug']}');

        return ApiResponse(data: article);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
