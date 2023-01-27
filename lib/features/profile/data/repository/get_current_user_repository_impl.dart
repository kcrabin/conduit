import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/source/remote/get_currrent_user_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/get_current_user_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetCurrentUserRepositoryImpl implements GetCurrentUserRepository {
  GetCurrentUserRemoteDataSource getCurrentUserRemoteDataSource;

  GetCurrentUserRepositoryImpl({required this.getCurrentUserRemoteDataSource});
  @override
  getCurrentUser() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet == true) {
      try {
        final response = await getCurrentUserRemoteDataSource.getUser();
        var data = jsonDecode(response.toString());
        print(data['user']['username']);

        return data;
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
