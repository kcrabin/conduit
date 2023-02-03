import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/response/my_article_response.dart';
import '../../domain/repository/my_article_repository.dart';

class MyArticleController extends GetxController {
  bool hasArticle = false;

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  ScrollController scrollController = ScrollController();

  bool get isLoading => _isLoading;

  ApiResponse apiResponse = ApiResponse();
  int offset = 0;
  int articleCount = 0;

  List<Articles> articleList = [];
  List<Articles> articles = [];

  getArticleByUser(int offset) async {
    isLoading = true;
    apiResponse = await Get.find<MyArticleRepository>().getMyArticle(offset);
    articles = apiResponse.data['articles']
        .map<Articles>((e) => Articles.fromJson(e))
        .toList();
    articleList = articleList + articles;
    articleCount = apiResponse.data['articlesCount'];
    print('this is my article controller ---${apiResponse.data}');

    if (apiResponse.data == null) {
      CustomException.noInternetConnecion();
    } else {
      apiResponse.data.isEmpty ? hasArticle = false : hasArticle = true;
    }
    update();
    isLoading = false;
  }

  scrollListener() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (articleList.length < articleCount)) {
      offset = offset + 20;
      getArticleByUser(offset);
      update();
    }
    // else {
    //   print('this is the end of the list');
    // }
  }

  @override
  void onInit() {
    scrollController.addListener(scrollListener);

    getArticleByUser(offset);
    super.onInit();
  }
}
