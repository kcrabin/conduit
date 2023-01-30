import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';
import '../../../../../core/utils/storage/sp_utils.dart';

abstract class GetFavArticlesRemoteDataSource {
  Future<dynamic> getFavArticles();
}

class GetFavArticlesRemoteDataSourceImpl
    implements GetFavArticlesRemoteDataSource {
  Dio dio;
  GetFavArticlesRemoteDataSourceImpl({required this.dio});
  @override
  Future getFavArticles() async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    SpUtils spUtils = SpUtils();
    String username = await spUtils.getString(StorageConstants.username);
   

    return dio.get(
      "${ApiConstants.baseUrl}/articles",
      queryParameters: <String, dynamic>{
        'favorited': '$username',
      },
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token $token'
        },
      ),
    );
  }
}
