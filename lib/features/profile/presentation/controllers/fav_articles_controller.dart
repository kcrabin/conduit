import 'package:conduit/features/profile/data/models/response/fav_article_response_model.dart';
import 'package:conduit/features/profile/domain/repository/fav_article_repository.dart';
import 'package:get/get.dart';

class GetFavArticlesController extends GetxController {
  List<Articles> articleList = [];
  bool hasArticle = false;

  @override
  void onInit() {
    getFavArticlesByUser();
    super.onInit();
  }

  getFavArticlesByUser() async {
    var data = await Get.find<GetFavArticlesRepository>().getFavArticles();

    articleList =
        data['articles'].map<Articles>((e) => Articles.fromJson(e)).toList();
    articleList.isEmpty ? hasArticle = false : hasArticle = true;

    update();
  }
}
