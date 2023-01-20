import 'package:conduit/features/home/data/repository/like_unlike_article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/like_unlike_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/like_unlike_article_repository.dart';
import 'package:conduit/features/home/presentation/controllers/like_unlike_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class FavoriteArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteArticleRemoteDataSource>(
      FavoriteArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );
    Get.put<FavoriteArticleRepository>(
      FavoriteArticleRepositoryImpl(
        favoriteArticleRemoteDataSource:
            Get.find<FavoriteArticleRemoteDataSource>(),
      ),
    );

    Get.put(FavoriteArticleController());
  }
}
