import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:conduit/features/profile/data/models/request/update_user_info_request.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class UpdateUserInfoRemoteDataSource {
  updateUser(UpdateUserInfo updateUserInfo);
}

class UpdateUserInfoRemoteDataSourceImpl
    implements UpdateUserInfoRemoteDataSource {
  Dio dio;
  UpdateUserInfoRemoteDataSourceImpl({required this.dio});
  @override
  updateUser(UpdateUserInfo updateUserInfo) async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);
    return dio.put(
      "${ApiConstants.baseUrl}/user",
      data: updateUserInfo.toJson(),
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $token',
        },
      ),
    );
  }
}
