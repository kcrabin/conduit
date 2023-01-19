import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/features/home/data/model/article_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';

abstract class AddNewArticleRemoteDataSource {
  Future<dynamic> addNewArticle(PostArticle postArticle);
}

class AddNewArticleRemoteDataSourceImpl
    implements AddNewArticleRemoteDataSource {
  final Dio dio;

  AddNewArticleRemoteDataSourceImpl({required this.dio});

  @override
  Future addNewArticle(PostArticle postArticle) async {
    StorageService _storage = StorageService();
    String? token = await _storage.get(StorageConstants.accessToken);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio.post("${ApiConstants.baseUrl}${ApiConstants.articles}",
        data: postArticle.toJson(),
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
