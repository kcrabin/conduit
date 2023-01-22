import 'dart:convert';

import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:conduit/features/auth/data/source/remote/login_remote_data_source.dart';
import 'package:conduit/features/auth/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/request/login_request_model.dart';
import '../model/response/login_response_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  requestLogin(LoginRequest user) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    LoginResponseInfo userInfo;
    StorageService storageService = StorageService();

    if (hasInternet == true) {
      try {
        final response = await loginRemoteDataSource.login(user);
        var data = jsonDecode(response.toString());

        userInfo = LoginResponseInfo.fromJson(data["user"]);

        storageService.set(StorageConstants.accessToken, userInfo.token ?? "");

        // Get.off(HomePageScreen());
        Get.offAllNamed('/navigation');

        // print('this is the map printed ----${data["user"]}');
        print('this is the user info token----${userInfo.token}');
      } on DioError catch (e) {
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
