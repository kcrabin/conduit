import 'package:conduit/features/home/data/model/response/single_article_by_slug.dart';
import 'package:conduit/features/home/domain/repository/get_single_article_by_slug_repository.dart';
import 'package:get/get.dart';

class GetSingleArticleBySlugController extends GetxController {
  @override
  void onInit() {
    getSelectedArticle;
    super.onInit();
  }

  bool _isLoading = true;

  // setter of _isLoading variable
  set isLoading(bool value) {
    _isLoading = value;
    update();
    // update() is the method similar to setState(){} method
  }

  bool get isLoading => _isLoading; //getter of _isLoading variable

  Article article = Article();
  late SingleArticleBySlug singleArticleBySlug;

  // String slug = '';

  getSelectedArticle(String slug) async {
    isLoading = true;
    var data =
        await Get.find<GetSingleArticleBySlug>().getSingleArticleBySlug(slug);
    singleArticleBySlug = SingleArticleBySlug.fromJson(data);
    article = singleArticleBySlug.article!;
    print('this is articles on single artricle by slug ---${article.body}');
    update();
    isLoading = false;
  }
}
