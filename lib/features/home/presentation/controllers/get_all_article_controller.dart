import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/local/storage_constants.dart';
import '../../../../core/utils/storage/sp_utils.dart';
import '../../data/model/response/get_article_response.dart';

class GetAllArticleController extends GetxController {
  @override
  void onInit() async {
    // scrollController.addListener(scrollListener);
    fetchAllArticles(limit, offset);
    update();
    super.onInit();
  }

  ScrollController scrollController = ScrollController();

  String? username;
  SpUtils spUtils = SpUtils();

  ApiResponse apiResponse = ApiResponse();
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  // double currentPosition = 0.0;
  int currentIndex = 0;

  bool get isLoading => _isLoading;
  int articleCount = 0;

  int offset = 0;
  int limit = 20;
  List<Articles> articleList = [];
  List<Articles> articles = [];

  fetchAllArticles(int limit, int offset) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetAllArticleRepository>().getArticleList(limit, offset);

    articles = apiResponse.data['articles']
        .map<Articles>((e) => Articles.fromJson(e))
        .toList();

    articleList = articleList + articles;
    articleCount = apiResponse.data['articlesCount'];

    username = await spUtils.getString(StorageConstants.username);
    // print('this is username from article controller----$username');
    print(
        'this is articles fetched from article controller----${articleList.length}');
    print('this is offset in article controller----$offset');

    update();
    isLoading = false;
  }

  fetchAllArticlesAfterLike(int limit, int offset) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetAllArticleRepository>().getArticleList(limit, offset);

    articles = apiResponse.data['articles']
        .map<Articles>((e) => Articles.fromJson(e))
        .toList();
    articleList = [];

    articleList = articleList + articles;
    articleCount = apiResponse.data['articlesCount'];

    username = await spUtils.getString(StorageConstants.username);
    // print('this is username from article controller----$username');
    print(
        'this is articles fetched from article controller after like----${articleList.length}');
    print('this is offset in article controller after like----$offset');

    update();
    isLoading = false;
  }

  loadMoreArticles() {
    if (articleList.length < articleCount) {
      offset = offset + 20;
      fetchAllArticles(limit, offset);
      update();
    } else {
      Get.snackbar('No more articles', 'You don\'t have any more articles');
    }
  }
}
