import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../../core/data/source/local/storage_constants.dart';
import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/storage_service.dart';
import '../../model/request/comment_request_model.dart';

abstract class CommentRemoteDataSource {
  postComment(String slug, CommentRequest comment);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  Dio dio;

  CommentRemoteDataSourceImpl({required this.dio});

  @override
  postComment(String slug, CommentRequest comment) async {
    StorageService storage = StorageService();
    String? token = await storage.get(StorageConstants.accessToken);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio.post("${ApiConstants.baseUrl}/articles/$slug/comments",
        data: comment.toJson(),
        options: Options(
            headers: <String, String>{'Authorization': 'Token $token'}));
  }
}
