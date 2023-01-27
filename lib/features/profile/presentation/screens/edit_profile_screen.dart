import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/core/presentation/widgets/textfield.dart';
import 'package:conduit/features/profile/presentation/controllers/update_user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/get_current_user_controller.dart';
import 'widgets/text_container.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getProfileController = Get.put(GetCurrentUserController());
    return GetBuilder<UpdateUserInfoController>(
        init: UpdateUserInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text('Update Profile')),
            body: getProfileController.isLoading == true
                ? Center(
                    child: Lottie.asset('assets/lottie/loading2.json'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      TextContainer(
                        text: controller.email,
                      ),
                      Spacing.sizeBoxH_10(),
                      TextContainer(
                        text: controller.username,
                      ),
                      Spacing.sizeBoxH_10(),
                      CustomTextField(
                          controller: controller.bioController,
                          labelText: 'bio'),
                      Spacing.sizeBoxH_10(),
                      CustomTextField(
                          controller: controller.imageController,
                          labelText: 'image'),
                      Spacing.sizeBoxH_10(),
                      CustomElevtedButton(
                          onClicked: () {
                            controller.updateCurrentUserInfo();
                            Get.back();
                          },
                          minSize:
                              Size(MediaQuery.of(context).size.width * 0.5, 50),
                          name: 'Update')
                    ]),
                  ),
          );
        });
  }
}
