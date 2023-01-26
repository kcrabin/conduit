import 'package:conduit/features/profile/domain/repository/delete_article_repository.dart';
import 'package:get/get.dart';

class DeleteArticleController extends GetxController {
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
  requestDelete(String slug) async {
    isLoading = true;
    await Get.find<DeleteArticleRepository>().deleteArticle(slug);
    isLoading = false;
  }
}
