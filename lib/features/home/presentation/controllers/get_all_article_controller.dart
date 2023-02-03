import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../../core/data/source/local/storage_constants.dart';
import '../../../../core/utils/storage/sp_utils.dart';
import '../../data/model/response/get_article_response.dart';

class GetAllArticleController extends GetxController {
  @override
  void onInit() async {
    fetchAllArticles(offset);
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

  int totalPages = 0;

  bool get isLoading => _isLoading;
  int articleCount = 0;

  int offset = 0;
  List<Articles> articleList = [];

  fetchAllArticles(int offset) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetAllArticleRepository>().getArticleList(offset);

    articleList = apiResponse.data['articles']
        .map<Articles>((e) => Articles.fromJson(e))
        .toList();
    articleCount = apiResponse.data['articlesCount'];

    username = await spUtils.getString(StorageConstants.username);
    // print('this is username from article controller----$username');
    print(
        'this is articles fetched from article controller----${articleList.length}');
    print('this is offset in article controller----$offset');

    update();
    isLoading = false;
  }

  // nextPage() {
  //   offset = offset + 1;
  //   fetchAllArticles(offset);
  //   update();
  // }

  // previousPage() {
  //   offset = offset - 1;
  //   fetchAllArticles(offset);
  //   update();
  // }
}
