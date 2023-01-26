import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/models/request/update_article_request.dart';
import 'package:conduit/features/profile/data/source/remote/edit_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/edit_article_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class EditArticleRepositoryImpl implements EditArticleRepository {
  EditArticleRemoteDataSource editArticleRemoteDataSource;
  EditArticleRepositoryImpl({required this.editArticleRemoteDataSource});

  @override
  editArticle(String slug, UpdateArticleRequest updateArticleRequest) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await editArticleRemoteDataSource
            .updateSelectedArticle(slug, updateArticleRequest);

        var data = jsonDecode(response.toString());
        // print('this is response after updating article --$data');
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
