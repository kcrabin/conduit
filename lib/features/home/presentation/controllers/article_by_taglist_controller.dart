import 'package:conduit/features/home/data/model/response/article_by_tag_response.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:get/get.dart';

class ArticleByTaglistController extends GetxController {
  List<Articles> articleList = [];

  // String tag = '';

  bool _isLoading = true;

  // setter of _isLoading variable
  set isLoading(bool value) {
    _isLoading = value;
    update();
    // update() is the method similar to setState(){} method
  }

  bool get isLoading => _isLoading;

  getAllArticlesByTag(String tag) async {
    isLoading = true;
    var data = await Get.find<ArticleByTagRepository>().getArticlesByTag(tag);

    articleList =
        data['articles'].map<Articles>((e) => Articles.fromJson(e)).toList();
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
