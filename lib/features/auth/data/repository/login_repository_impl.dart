import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:conduit/features/auth/data/source/remote/login_remote_data_source.dart';
import 'package:conduit/features/auth/domain/repository/login_repository.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/presentation/routes/app_routes.dart';
import '../model/register_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  requestLogin(User user) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    User1 userInfo;
    StorageService storageService = StorageService();

    if (hasInternet == true) {
      try {
        final response = await loginRemoteDataSource.login(user);
        var data = jsonDecode(response.toString());

        userInfo = User1.fromJson(data["user"]);

        storageService.setToken(userInfo.token ?? "");

        // Get.off(HomePageScreen());
        Get.toNamed("/home");

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
