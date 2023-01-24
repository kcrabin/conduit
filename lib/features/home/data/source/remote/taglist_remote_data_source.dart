import 'package:dio/dio.dart';

import '../../../../../core/data/source/remote/api_constants.dart';

abstract class TaglistRemoteDataSource {
  Future<dynamic> getTaglist();
}

class TaglistRemoteDataSourceImpl implements TaglistRemoteDataSource {
  Dio dio;
  TaglistRemoteDataSourceImpl({required this.dio});
  @override
  Future getTaglist() {
    return dio.get("${ApiConstants.baseUrl}${ApiConstants.tags}");
  }
}
