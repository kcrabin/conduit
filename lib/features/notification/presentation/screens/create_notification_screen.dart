import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/core/presentation/widgets/textfield.dart';
import 'package:conduit/features/notification/presentation/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Notification')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<NotificationController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: controller.usernameController,
                  labelText: 'username'),
              Spacing.sizeBoxH_10(),
              CustomTextField(
                  controller: controller.titleController, labelText: 'title'),
              Spacing.sizeBoxH_10(),
              CustomTextField(
                  controller: controller.messageController,
                  labelText: 'message'),
              Spacing.sizeBoxH_10(),
              CustomElevtedButton(
                  onClicked: () {
                    controller.sendNotification();
                  },
                  minSize: Size(150, 50),
                  name: 'Submit'),
            ],
          );
        }),
      ),
    );
  }
}
