import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/data/models/request/update_user_info_request.dart';
import 'package:conduit/features/profile/domain/repository/update_user_info_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/get_current_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/models/response/get_profile_response.dart';

class UpdateUserInfoController extends GetxController {
  @override
  void onInit() async {
    getUserInfo();

    super.onInit();
  }

  getUserInfo() async {
    // bool hasInternet = await InternetConnectionChecker().hasConnection;
    // if (hasInternet == true) {
    GetProfileResponse? userProfileResponse =
        await Get.put(GetCurrentUserController()).getCurrentUserDetail();
    if (userProfileResponse != null) {
      bioController.text = userProfileResponse.user!.bio ?? "";
      imageController.text = userProfileResponse.user!.image!;
      username = userProfileResponse.user!.username!;
      email = userProfileResponse.user!.email!;
    } else {
      CustomException.noInternetConnecion();
    }
    update();
    // } else {
    //   CustomException.noInternetConnecion();
    //   // Get.back();
    // }
  }

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  //  userProfileResponse = GetProfileResponse();
  late UpdateUserInfo updateUserInfo;
  late UserInfo userInfo;

  TextEditingController bioController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  String username = '';
  String email = '';

  updateCurrentUserInfo() async {
    isLoading = true;
    userInfo = UserInfo(
      bio: bioController.text,
      image: imageController.text,
    );

    updateUserInfo = UpdateUserInfo(userInfo: userInfo);
    await Get.find<UpdateUserInfoRepository>().updateUserInfo(updateUserInfo);
    isLoading = false;
  }
}
