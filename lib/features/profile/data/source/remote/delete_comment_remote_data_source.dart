import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class DeleteCommentRemoteDataSource {
  deleteSelectedComment(String slug, String commentId);
}

class DeleteCommentRemoteDataSourceImpl
    implements DeleteCommentRemoteDataSource {
  Dio dio;
  DeleteCommentRemoteDataSourceImpl({required this.dio});
  @override
  deleteSelectedComment(String slug, String commentId) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.delete(
      "${ApiConstants.baseUrl}/articles/$slug/comments/$commentId",
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
