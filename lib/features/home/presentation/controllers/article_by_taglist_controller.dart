import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:get/get.dart';

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

  getAllArticlesByTag(String tag) async {
    isLoading = true;
    apiResponse = await Get.find<ArticleByTagRepository>().getArticlesByTag(tag);

    
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
