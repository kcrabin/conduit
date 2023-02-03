import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/sp_utils.dart';
import 'package:conduit/features/home/presentation/screens/add_article_screen.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:conduit/features/profile/presentation/controllers/get_current_user_controller.dart';
import 'package:conduit/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../profile/data/models/response/get_profile_response.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;
  SpUtils spUtils = SpUtils();
  String? username;

  List<Widget> pages = [
    const HomePageScreen(),
    const AddArticleScreen(),
    const ProfileScreen(),
  ];

  Widget get currentPage => IndexedStack(
        index: selectedIndex.value,
        children: pages,
      );

  void changeIndex(int index) {
    selectedIndex(index);
  }

  @override
  void onInit() async {
    GetProfileResponse? userProfileResponse =
        await Get.put(GetCurrentUserController()).getCurrentUserDetail();
    // print(
    //     'this is current user detail ---${userProfileResponse.user!.username}');
    spUtils.setString(
        StorageConstants.username, userProfileResponse?.user?.username! ?? '');
    // username = await spUtils.getString(StorageConstants.username);
    // print('this is username from main navigation----$username');

    super.onInit();
  }
}
