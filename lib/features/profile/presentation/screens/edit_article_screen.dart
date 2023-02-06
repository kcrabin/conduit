import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/utils/validators.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/core/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/data/model/response/single_article_by_slug.dart';
import '../controllers/edit_article_controller.dart';
import '../controllers/my_articles_controller.dart';

class EditArticleScreen extends StatelessWidget {
  final Article article;
  EditArticleScreen({super.key, required this.article});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myArticleController = Get.put(MyArticleController());

    // final addArticleController = Get.find<AddNewArticleController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Edit article')),
      body: SingleChildScrollView(
        child: GetBuilder<EditArticleController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
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
                        if (_formkey.currentState!.validate()) {
                          controller.updateArticle(article.slug!);
                          // Get.toNamed('/profile');
                          myArticleController.getArticleByUser(
                              20, myArticleController.offset);
                          Get.back();
                          Get.back();
                        } else {
                          Get.snackbar("Empty Fields",
                              "You cannot publish empty article");
                        }
                      },
                      minSize:
                          Size(MediaQuery.of(context).size.width * 0.5, 50),
                      name: 'Update Article')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
