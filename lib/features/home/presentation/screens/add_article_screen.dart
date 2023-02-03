import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/utils/validators.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/core/presentation/widgets/textfield.dart';
import 'package:conduit/features/home/presentation/controllers/add_new_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddArticleScreen extends StatelessWidget {
  const AddArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    // final addArticleController = Get.find<AddNewArticleController>();
    return Scaffold(
      appBar: AppBar(title: const Text('New article')),
      body: SingleChildScrollView(
        child: GetBuilder<AddNewArticleController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CustomTextField(
                    lines: 2,
                    controller: controller.titleController,
                    labelText: 'Article Title',
                    validator: (value) => Validators.validateComment(value!),
                  ),
                  Spacing.sizeBoxH_10(),
                  CustomTextField(
                    lines: 3,
                    controller: controller.descriptionController,
                    labelText: 'What\'s this article about?',
                    validator: (value) => Validators.validateComment(value!),
                  ),
                  Spacing.sizeBoxH_10(),
                  CustomTextField(
                    lines: 10,
                    controller: controller.bodyController,
                    labelText: 'Write your article',
                    validator: (value) => Validators.validateComment(value!),
                  ),
                  Spacing.sizeBoxH_10(),
                  CustomTextField(
                    lines: 2,
                    controller: controller.tagListController,
                    labelText: 'Enter tags',
                    // validator: (value) => Validators.validateComment(value!),
                  ),
                  Spacing.sizeBoxH_20(),
                  CustomElevtedButton(
                      onClicked: () {
                        if (formkey.currentState!.validate()) {
                          controller.publishArticle();
                          Get.toNamed("/navigation");
                        } else {
                          Get.snackbar("Empty Fields",
                              "You cannot publish empty article");
                        }
                      },
                      minSize:
                          Size(MediaQuery.of(context).size.width * 0.5, 50),
                      name: 'Publish Article')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
