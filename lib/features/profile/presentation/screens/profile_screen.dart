import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/features/profile/presentation/controllers/get_current_user_controller.dart';
import 'package:conduit/features/profile/presentation/controllers/profile_controller.dart';
import 'package:conduit/features/profile/presentation/screens/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/local/storage_constants.dart';
import '../../../../core/utils/storage/sp_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final myArticleController = Get.find<MyArticleController>();
    final profileController = Get.find<ProfileController>();
    // final getFavArticles = Get.find<GetFavArticlesController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContainerButton(
              name: 'My Articles',
              onPressed: () {
                // myArticleController.getArticleByUser();
                Get.toNamed("/myArticles");
              },
            ),
            Spacing.sizeBoxH_10(),
            ContainerButton(
              name: 'Favorited Articles',
              onPressed: () {
                // getFavArticles.getFavArticlesByUser();
                Get.toNamed("/favArticleScreen");
              },
            ),
            Spacing.sizeBoxH_10(),
            ContainerButton(
              name: 'Edit Profile',
              onPressed: () async {
                Get.put(GetCurrentUserController()).getCurrentUserDetail();
                Get.toNamed("/editProfileScreen");
              },
            ),
            const Spacer(),
            CustomElevtedButton(
              onClicked: () {
                profileController.logout();
              },
              minSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
              name: 'Log out',
            ),
            Spacing.sizeBoxH_10()
          ],
        ),
      ),
    );
  }
}
