import 'package:conduit/features/auth/data/model/register_model.dart';
import 'package:conduit/features/auth/data/repository/login_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/login_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LoginController extends GetxController {
  late User user;
  late User1 user1;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void requestLogin() {
    LoginRepositoryImpl loginRepositoryImpl = LoginRepositoryImpl(
        loginRemoteDataSource: Get.find<LoginRemoteDataSource>());

    user1 = User1(
      email: emailController.text,
      password: passwordController.text,
    );

    user = User(user: user1);

    loginRepositoryImpl.requestLogin(user);
  }
}
