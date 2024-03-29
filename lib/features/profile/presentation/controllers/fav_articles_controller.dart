import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/profile/domain/repository/fav_article_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/response/fav_article_response_model.dart';

class GetFavArticlesController extends GetxController {
  bool hasArticle = false;

  @override
  void onInit() {
    // scrollController.addListener(scrollListener);

    getFavArticlesByUser(limit, offset);
    super.onInit();
  }

  ScrollController scrollController = ScrollController();

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
  ApiResponse apiResponse = ApiResponse();

  int offset = 0;
  int limit = 20;

  List<Articles> articleList = [];
  List<Articles> articles = [];
  int articleCount = 0;

  getFavArticlesByUser(int limit, int offset) async {
    isLoading = true;
    apiResponse = await Get.find<GetFavArticlesRepository>()
        .getFavArticles(limit, offset);
    if (apiResponse.hasData) {
      articles = apiResponse.data['articles']
          .map<Articles>((e) => Articles.fromJson(e))
          .toList();

      articleList = articleList + articles;
      articleCount = apiResponse.data['articlesCount'];
    }
    if (apiResponse.data != null) {
      apiResponse.data.isEmpty ? hasArticle = false : hasArticle = true;
    } else {
      CustomException.noInternetConnecion();
    }
    update();
    isLoading = false;
  }

  getFavArticlesByUserAfterLike(int limit, int offset) async {
    isLoading = true;
    apiResponse = await Get.find<GetFavArticlesRepository>()
        .getFavArticles(limit, offset);
    articles = apiResponse.data['articles']
        .map<Articles>((e) => Articles.fromJson(e))
        .toList();

    articleList = [];
    articleList = articleList + articles;
    articleCount = apiResponse.data['articlesCount'];
    if (apiResponse.data != null) {
      apiResponse.data.isEmpty ? hasArticle = false : hasArticle = true;
    } else {
      CustomException.noInternetConnecion();
    }
    update();
    isLoading = false;
  }

  loadMoreArticles() {
    if (articleList.length < articleCount) {
      offset = offset + 20;
      getFavArticlesByUser(limit, offset);
      update();
    } else {
      Get.snackbar('No more articles', 'You don\'t have any more articles');
    }
  }

  // scrollListener() {
  //   if ((scrollController.position.pixels ==
  //           scrollController.position.maxScrollExtent) &&
  //       (articleList.length < articleCount)) {
  //     offset = offset + 20;
  //     getFavArticlesByUser(limit, offset);
  //     update();
  //   }
  //   // else {
  //   //   print('this is the end of the list');
  //   // }
  // }
}
