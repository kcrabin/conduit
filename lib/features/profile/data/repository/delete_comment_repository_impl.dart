import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/profile/data/source/remote/delete_comment_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/delete_comment_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DeleteCommentRepositoryImpl implements DeleteCommentRepository {
  DeleteCommentRemoteDataSource deleteCommentRemoteDataSource;
  DeleteCommentRepositoryImpl({required this.deleteCommentRemoteDataSource});
  @override
  deleteComment(String slug, String commentId) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await deleteCommentRemoteDataSource
            .deleteSelectedComment(slug, commentId);
        var data = jsonDecode(response.toString());
        print('this is response after delete comment---$data');

        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
