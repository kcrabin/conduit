import 'package:conduit/features/profile/data/models/response/my_article_response.dart';
import 'package:get/get.dart';

import '../../domain/repository/my_article_repository.dart';

class MyArticleController extends GetxController {
  List<Articles> articleList = [];
  getArticleByUser() async {
    var data = await Get.find<MyArticleRepository>().getMyArticle();
    articleList =
        data['articles'].map<Articles>((e) => Articles.fromJson(e)).toList();
    update();

    // print('this is articles by user ---$articleList');
  }

  @override
  void onInit() {
    getArticleByUser();
    super.onInit();
  }
}
