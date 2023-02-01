import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class FollowUnfollowRemoteDataSource {
  follow(String username);

  unfollow(String username);
}

class FollowUnfollowRemoteDataSourceImpl
    implements FollowUnfollowRemoteDataSource {
  Dio dio;

  FollowUnfollowRemoteDataSourceImpl({required this.dio});
  @override
  follow(String username) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.post(
      "${ApiConstants.baseUrl}/profiles/$username/follow",
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }

  @override
  unfollow(String username) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.delete(
      "${ApiConstants.baseUrl}/profiles/$username/follow",
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
