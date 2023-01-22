import 'dart:convert';

import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/auth/data/model/request/register_request_model.dart';
import 'package:conduit/features/auth/data/model/response/register_response.dart';
import 'package:conduit/features/auth/data/source/remote/register_remote_data_source.dart';
import 'package:conduit/features/auth/domain/repository/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/utils/storage/storage_service.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({required this.registerRemoteDataSource});

  @override
  requestRegister(RegisterUser user) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    RegisterResponseInfo userInfo;
    StorageService storageService = StorageService();

    if (hasInternet == true) {
      try {
        final response = await registerRemoteDataSource.register(user);
        var data = jsonDecode(response.toString());

        userInfo = RegisterResponseInfo.fromJson(data["user"]);
        storageService.set(StorageConstants.accessToken, userInfo.token ?? "");

        Get.offAllNamed('/navigation');

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
