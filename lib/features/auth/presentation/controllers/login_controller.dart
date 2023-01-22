import 'package:conduit/features/auth/data/repository/login_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/login_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../data/model/request/login_request_model.dart';

class LoginController extends GetxController {
  late LoginRequest user;
  late LoginUserInfo user1;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void requestLogin() {
    LoginRepositoryImpl loginRepositoryImpl = LoginRepositoryImpl(
        loginRemoteDataSource: Get.find<LoginRemoteDataSource>());

    user1 = LoginUserInfo(
      email: emailController.text,
      password: passwordController.text,
    );

    user = LoginRequest(user: user1);

    loginRepositoryImpl.requestLogin(user);
  }
}
