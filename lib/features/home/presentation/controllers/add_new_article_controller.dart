import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/data/repository/add_new_article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/network_exception.dart';
import '../../../../core/presentation/widgets/error_view.dart';
import '../../data/model/request/post_article_model.dart';

class AddNewArticleController extends GetxController {
  late ArticleRequestInfo articles;
  late PostArticleRequest postArticle;

  AddNewArticleRepositoryImpl addNewArticleRepositoryImpl =
      AddNewArticleRepositoryImpl(
          addNewArticleRemoteDataSource:
              Get.find<AddNewArticleRemoteDataSource>());

  List<String> tagList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController tagListController = TextEditingController();

  ApiResponse apiResponse = ApiResponse();

  publishArticle() async {
    tagList = tagListController.text.split(" ");

    articles = ArticleRequestInfo(
      title: titleController.text,
      description: descriptionController.text,
      body: bodyController.text,
      tagList: tagList,
    );

    postArticle = PostArticleRequest(article: articles);

    apiResponse = await addNewArticleRepositoryImpl.addArticle(postArticle);

    await showMessage(apiResponse);
    update();

    // print('this is boolean form controller--------$hasData');

    // titleController.clear();
    // descriptionController.clear();
    // bodyController.clear();
    // tagList.clear();
  }

  showMessage(ApiResponse apiResponse) {
    if (apiResponse.hasData) {
      Get.snackbar('Added Successfully', 'Article Added Successfully');

      print('this is from add article controller-- ${apiResponse.data}');
    } else if (apiResponse.hasError) {
      Center(
        child: ErrorView(
          title: NetworkException.getErrorMessage(apiResponse.error),
        ),
      );
    }
  }
}
