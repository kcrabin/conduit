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
    scrollController.addListener(scrollListener);
    fetchAllArticles(offset);
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

  int totalPages = 0;

  bool get isLoading => _isLoading;
  int articleCount = 0;

  int offset = 0;
  List<Articles> articleList = [];
  List<Articles> articles = [];

  fetchAllArticles(int offset) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetAllArticleRepository>().getArticleList(offset);

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

  scrollListener() {
    var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;

    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (articleList.length < articleCount)) {
      offset = offset + 20;
      fetchAllArticles(offset);
      update();
    }
    // else {
    //   print('this is the end of the list');
    // }
  }
}
