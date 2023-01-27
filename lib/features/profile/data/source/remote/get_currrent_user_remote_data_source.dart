import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class GetCurrentUserRemoteDataSource {
  getUser();
}

class GetCurrentUserRemoteDataSourceImpl
    implements GetCurrentUserRemoteDataSource {
  Dio dio;
  GetCurrentUserRemoteDataSourceImpl({required this.dio});

  @override
  getUser() async {
    StorageService storageService = StorageService();
    String? token = await storageService.get(StorageConstants.accessToken);

    return dio.get(
      "${ApiConstants.baseUrl}/user",
      options: Options(
        headers: <String, String>{'Authorization': 'Token $token'},
      ),
    );
  }
}
