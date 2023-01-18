import 'package:conduit/features/auth/data/repository/register_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/register_remote_data_source.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/model/register_model.dart';

class RegisterController extends GetxController {
  late User user;
  late User1 user1;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void requestRegister() {
    RegisterRepositoryImpl registerRepositoryImpl = RegisterRepositoryImpl(
        registerRemoteDataSource: Get.find<RegisterRemoteDataSource>());
    user1 = User1(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);
    user = User(user: user1);

    registerRepositoryImpl.requestRegister(user);
  }
}
