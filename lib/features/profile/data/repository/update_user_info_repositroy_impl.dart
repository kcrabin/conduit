import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/models/request/update_user_info_request.dart';
import 'package:conduit/features/profile/data/source/remote/update_user_info_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/update_user_info_repository.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class UpdateUserInfoRepositoryImpl implements UpdateUserInfoRepository {
  UpdateUserInfoRemoteDataSource updateUserInfoRemoteDataSource;
  UpdateUserInfoRepositoryImpl({required this.updateUserInfoRemoteDataSource});
  @override
  updateUserInfo(UpdateUserInfo updateUserInfo) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await updateUserInfoRemoteDataSource.updateUser(updateUserInfo);
        var data = jsonDecode(response.toString());
        print('this is response after info update---$data');
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
