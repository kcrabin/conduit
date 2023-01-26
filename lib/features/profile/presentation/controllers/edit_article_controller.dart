import 'package:conduit/features/profile/data/models/request/update_article_request.dart';
import 'package:conduit/features/profile/domain/repository/edit_article_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditArticleController extends GetxController {
  List<String> tagList = [];

  late UpdateArticleRequest updateArticleRequest;
  late Article article;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController tagListController = TextEditingController();

  updateArticle(String slug) async {
    tagList = tagListController.text.split(" ");

    article = Article(
        title: titleController.text,
        description: descriptionController.text,
        body: bodyController.text,
        tagList: tagList);

    updateArticleRequest = UpdateArticleRequest(article: article);

    await Get.find<EditArticleRepository>()
        .editArticle(slug, updateArticleRequest);
  }
}
