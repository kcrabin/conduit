import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/profile/domain/repository/fav_article_repository.dart';
import 'package:get/get.dart';

class GetFavArticlesController extends GetxController {
  bool hasArticle = false;

  @override
  void onInit() {
    getFavArticlesByUser();
    super.onInit();
  }

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
  ApiResponse apiResponse = ApiResponse();

  getFavArticlesByUser() async {
    isLoading = true;
    apiResponse = await Get.find<GetFavArticlesRepository>().getFavArticles();

    apiResponse.data.isEmpty ? hasArticle = false : hasArticle = true;

    update();
    isLoading = false;
  }
}
