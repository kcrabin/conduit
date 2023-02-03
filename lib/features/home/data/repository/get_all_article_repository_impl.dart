import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/source/remote/get_all_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';

import '../../data/model/response/get_article_response.dart';

class GetAllArticleRepositoryImpl implements GetAllArticleRepository {
  final GetAllArticleRemoteDataSource articleRemoteDataSource;

  GetAllArticleRepositoryImpl({required this.articleRemoteDataSource});

  @override
  getArticleList(int offset) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await articleRemoteDataSource.getAllArticles(offset);
        var data = jsonDecode(response.toString());
        

        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
