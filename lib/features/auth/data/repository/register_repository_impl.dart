import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/auth/data/source/remote/register_remote_data_source.dart';
import 'package:conduit/features/auth/domain/repository/register_repository.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/utils/storage/storage_service.dart';
import '../model/register_model.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({required this.registerRemoteDataSource});

  @override
  requestRegister(User user) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    User1 userInfo;
    StorageService storageService = StorageService();

    if (hasInternet == true) {
      try {
        final response = await registerRemoteDataSource.register(user);
        var data = jsonDecode(response.toString());

        userInfo = User1.fromJson(data["user"]);
        storageService.setToken(userInfo.token ?? "");

        Get.off(HomePageScreen());

        print('this is response form server on try method ----$response');
      } on DioError catch (e) {
        print('this is response form server ----${e.response}');
        CustomException.errorMessage(e);
      }
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
