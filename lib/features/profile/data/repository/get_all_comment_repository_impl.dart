import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/profile/data/source/remote/get_all_comment_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/get_all_comment_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/response/get_all_comments_response.dart';

class GetAllCommentsRepositoryImpl implements GetAllCommentsRepository {
  GetAllCommentsRemoteDataSource getAllCommentsRemoteDataSource;
  GetAllCommentsRepositoryImpl({required this.getAllCommentsRemoteDataSource});
  @override
  getAllComments(String slug) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    // GetAllCommentsResponse commentsResponse;
    List<Comments> comments;

    if (hasInternet == true) {
      try {
        final response = await getAllCommentsRemoteDataSource.getComments(slug);
        var data = jsonDecode(response.toString());
        // commentsResponse = GetAllCommentsResponse(comments: data['comments']);
        comments = data['comments']
            .map<Comments>((e) => Comments.fromJson(e))
            .toList();
        print('this is comments printed ---- ${comments[1].id}');

        return ApiResponse(data: comments);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
