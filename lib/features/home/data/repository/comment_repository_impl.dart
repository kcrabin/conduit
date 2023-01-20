import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/model/comment_model.dart';
import 'package:conduit/features/home/data/source/remote/comment_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/comment_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRemoteDataSource commentRemoteDataSource;

  CommentRepositoryImpl({required this.commentRemoteDataSource});
  @override
  addComment(String slug, Comment comment) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await commentRemoteDataSource.postComment(slug, comment);

        var data = jsonDecode(response.toString());

        print('this is data after comment ---- ${data['comment']}');

        return data;
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
