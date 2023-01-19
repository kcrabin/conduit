import 'package:conduit/features/home/data/model/article_model.dart';
import 'package:conduit/features/home/data/repository/add_new_article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewArticleController extends GetxController {
  late Articles articles;
  late PostArticle postArticle;

  AddNewArticleRepositoryImpl addNewArticleRepositoryImpl =
      AddNewArticleRepositoryImpl(
          addNewArticleRemoteDataSource:
              Get.find<AddNewArticleRemoteDataSource>());

  List<String> tagList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController tagListController = TextEditingController();

  publishArticle() {
    tagList = tagListController.text.split(" ");

    articles = Articles(
      title: titleController.text,
      description: descriptionController.text,
      body: bodyController.text,
      tagList: tagList,
    );

    postArticle = PostArticle(articles: articles);

    var hasData = addNewArticleRepositoryImpl.addArticle(postArticle);

    print('this is boolean form controller--------$hasData');

    // titleController.clear();
    // descriptionController.clear();
    // bodyController.clear();
    // tagList.clear();
  }
}
