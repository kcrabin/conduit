import 'package:conduit/features/home/domain/repository/article_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../data/model/article_model.dart';

class ArticleController extends GetxController {
  @override
  void onInit() {
    fetchAllArticles();
    super.onInit();
  }

  List<Articles> articleList = [];
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  fetchAllArticles() async {
    isLoading = true;
    // articleList = await Get.find<ArticleRepository>().getArticleList();
    var data = await Get.find<ArticleRepository>().getArticleList();
    articleList =
        data['articles'].map<Articles>((e) => Articles.fromJson(e)).toList();
    final articleCount = data['articlesCount'];

    print(articleCount);

    print(articleList[1].author!.username.toString());
    isLoading = false;
  }
}
