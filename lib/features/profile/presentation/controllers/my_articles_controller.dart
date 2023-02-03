import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:get/get.dart';

import '../../domain/repository/my_article_repository.dart';

class MyArticleController extends GetxController {
  bool hasArticle = false;

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  ApiResponse apiResponse = ApiResponse();

  getArticleByUser() async {
    isLoading = true;
    apiResponse = await Get.find<MyArticleRepository>().getMyArticle();
    print('this is my article controller ---${apiResponse.data}');

    if (apiResponse.data == null) {
      CustomException.noInternetConnecion();
    } else {
      apiResponse.data.isEmpty ? hasArticle = false : hasArticle = true;
    }
    update();
    isLoading = false;
  }

  @override
  void onInit() {
    getArticleByUser();
    super.onInit();
  }
}
