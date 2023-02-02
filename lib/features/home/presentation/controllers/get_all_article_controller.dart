import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../../core/data/source/local/storage_constants.dart';
import '../../../../core/utils/storage/sp_utils.dart';

class GetAllArticleController extends GetxController {
  @override
  void onInit() async {
    fetchAllArticles();
    super.onInit();
  }

  String? username;
  SpUtils spUtils = SpUtils();

  ApiResponse apiResponse = ApiResponse();
  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  fetchAllArticles() async {
    isLoading = true;
    apiResponse = await Get.find<GetAllArticleRepository>().getArticleList();

    username = await spUtils.getString(StorageConstants.username);
    print('this is username from article controller----$username');

    update();
    isLoading = false;
  }
}
