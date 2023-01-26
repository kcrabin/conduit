import 'package:conduit/features/profile/data/models/response/my_article_response.dart';
import 'package:get/get.dart';

import '../../domain/repository/my_article_repository.dart';

class MyArticleController extends GetxController {
  List<Articles> articleList = [];
  bool hasArticle = false;
  getArticleByUser() async {
    var data = await Get.find<MyArticleRepository>().getMyArticle();
    articleList =
        data['articles'].map<Articles>((e) => Articles.fromJson(e)).toList();
    articleList.isEmpty ? hasArticle = false : hasArticle = true;

    update();

    // print('this is articles by user ---$articleList');
  }

  @override
  void onInit() {
    getArticleByUser();
    super.onInit();
  }
}
