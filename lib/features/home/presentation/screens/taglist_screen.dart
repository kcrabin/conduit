import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/features/home/presentation/controllers/taglist_controller.dart';
import 'package:conduit/features/profile/presentation/screens/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/data/source/remote/network_exception.dart';
import '../../../../core/presentation/widgets/error_view.dart';
import '../controllers/article_by_taglist_controller.dart';

class TaglistScreen extends StatelessWidget {
  const TaglistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final articleByTaglistController = Get.put(ArticleByTaglistController());

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
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
      ),
      body: GetBuilder<TagListController>(
          init: TagListController(),
          builder: (controller) {
            if (controller.apiResponse.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.isLoading == true
                    ? Center(
                        child: Lottie.asset('assets/lottie/loading2.json'),
                      )
                    : ListView.builder(
                        itemCount: controller.apiResponse.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ContainerButton(
                                onPressed: () {
                                  Get.toNamed("/articleByTagScreen",
                                      arguments:
                                          controller.apiResponse.data[index]);
                                  Get.put(ArticleByTaglistController())
                                      .getAllArticlesByTag(
                                          controller.apiResponse.data[index]);
                                },
                                name: controller.apiResponse.data[index]),
                          );
                        }),
              );
            } else if (controller.apiResponse.hasError) {
              return Center(
                child: ErrorView(
                  title: NetworkException.getErrorMessage(
                      controller.apiResponse.error),
                ),
              );
            } else {
              return Center(
                child: Lottie.asset('assets/lottie/loading2.json'),
              );
            }
          }),
    );
  }
}
