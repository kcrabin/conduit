import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class GetAllCommentsRemoteDataSource {
  getComments(String slug);
}

class GetAllCommentsRemoteDataSourceImpl
    implements GetAllCommentsRemoteDataSource {
  Dio dio;
  GetAllCommentsRemoteDataSourceImpl({required this.dio});

  @override
  getComments(String slug) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.get(
      "${ApiConstants.baseUrl}/articles/$slug/comments",
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
