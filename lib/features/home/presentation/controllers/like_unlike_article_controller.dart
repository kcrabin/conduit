import 'package:get/get.dart';

import '../../data/repository/like_unlike_article_repository_impl.dart';
import '../../data/source/remote/like_unlike_article_remote_data_source.dart';

class FavoriteArticleController extends GetxController {
  FavoriteArticleRepositoryImpl favoriteArticleRepositoryImpl =
      FavoriteArticleRepositoryImpl(
          favoriteArticleRemoteDataSource:
              Get.find<FavoriteArticleRemoteDataSource>());

  likeArticle(String slug) async {
    favoriteArticleRepositoryImpl.favoriteArticle(slug);
    update();
  }

  unlikeArticle(String slug) {
    favoriteArticleRepositoryImpl.unfavoriteArticle(slug);
    update();
  }
}
