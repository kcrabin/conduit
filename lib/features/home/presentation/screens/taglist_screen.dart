import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/features/home/presentation/controllers/taglist_controller.dart';
import 'package:conduit/features/profile/presentation/screens/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/article_by_taglist_controller.dart';

class TaglistScreen extends StatelessWidget {
  const TaglistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final articleByTaglistController = Get.put(ArticleByTaglistController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Popular tags',
          style: AppThemes.textTheme.headline4,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
      ),
      body: GetBuilder<TagListController>(
          init: TagListController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.tags.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ContainerButton(
                              onPressed: () {
                                Get.toNamed("/articleByTagScreen",
                                    arguments: controller.tags[index]);
                                Get.put(ArticleByTaglistController())
                                    .getAllArticlesByTag(
                                        controller.tags[index]);
                              },
                              name: controller.tags[index]),
                        );
                      }),
            );
          }),
    );
  }
}
