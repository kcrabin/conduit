import 'package:conduit/features/home/domain/repository/get_single_article_by_slug_repository.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/api_result.dart';

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

  ApiResponse apiResponse = ApiResponse();

  // String slug = '';

  getSelectedArticle(String slug) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetSingleArticleBySlug>().getSingleArticleBySlug(slug);

    update();
    isLoading = false;
  }
}
