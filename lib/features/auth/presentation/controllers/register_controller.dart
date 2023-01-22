import 'package:conduit/features/auth/data/repository/register_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/register_remote_data_source.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/model/request/register_request_model.dart';

class RegisterController extends GetxController {
  late RegisterUser user;
  late RegisterUserInfo userInfo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void requestRegister() {
    RegisterRepositoryImpl registerRepositoryImpl = RegisterRepositoryImpl(
        registerRemoteDataSource: Get.find<RegisterRemoteDataSource>());
    userInfo = RegisterUserInfo(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);
    user = RegisterUser(user: userInfo);

    registerRepositoryImpl.requestRegister(user);
  }
}
