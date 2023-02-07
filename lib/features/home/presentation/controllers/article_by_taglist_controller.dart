import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:get/get.dart';

import '../../data/model/response/article_by_tag_response.dart';

class ArticleByTaglistController extends GetxController {
  // String tag = '';

  bool _isLoading = true;

  // setter of _isLoading variable
  set isLoading(bool value) {
    _isLoading = value;
    update();
    // update() is the method similar to setState(){} method
  }

  bool get isLoading => _isLoading;
  ApiResponse apiResponse = ApiResponse();
  int articleCount = 0;

  int offset = 0;
  int limit = 20;
  List<Articles> articleList = [];
  List<Articles> articles = [];

  getAllArticlesByTag(String tag, int limit, int offset) async {
    isLoading = true;
    apiResponse = await Get.find<ArticleByTagRepository>()
        .getArticlesByTag(tag, limit, offset);
    if (apiResponse.hasData) {
      articles = apiResponse.data['articles']
          .map<Articles>((e) => Articles.fromJson(e))
          .toList();
      articleCount = apiResponse.data['articlesCount'];
    }
    articleList = articleList + articles;

    update();

    print('this is printed tag from controller ----$tag');
    isLoading = false;
  }

  getAllArticlesByTagAfterLike(String tag, int limit, int offset) async {
    isLoading = true;
    apiResponse = await Get.find<ArticleByTagRepository>()
        .getArticlesByTag(tag, limit, offset);
    if (apiResponse.hasData) {
      articles = apiResponse.data['articles']
          .map<Articles>((e) => Articles.fromJson(e))
          .toList();
      articleCount = apiResponse.data['articlesCount'];
    }
    articleList = [];
    articleList = articleList + articles;

    update();

    print('this is printed tag from controller ----$tag');
    isLoading = false;
  }

  @override
  void onInit() {
    // getAllArticlesByTag(String tag);
    super.onInit();
  }
}
