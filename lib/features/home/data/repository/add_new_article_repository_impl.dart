import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/model/response/get_article_response.dart';
import 'package:conduit/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/add_new_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/request/post_article_model.dart';

class AddNewArticleRepositoryImpl implements AddNewArticleRepository {
  AddNewArticleRemoteDataSource addNewArticleRemoteDataSource;

  AddNewArticleRepositoryImpl({required this.addNewArticleRemoteDataSource});

  @override
  addArticle(PostArticleRequest postArticle) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await addNewArticleRemoteDataSource.addNewArticle(postArticle);
        var data = jsonDecode(response.toString());

        print(
            'this is data after publish article ---- ${data['article']['title']}');

        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
