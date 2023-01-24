import 'package:conduit/features/profile/data/repository/fav_article_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/fav_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/fav_article_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/fav_articles_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetFavArticlesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetFavArticlesRemoteDataSource>(
      GetFavArticlesRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<GetFavArticlesRepository>(
      GetFavArticlesRepositoryImpl(
        favArticleRemoteDataSource: Get.find<GetFavArticlesRemoteDataSource>(),
      ),
    );

    Get.put(
      GetFavArticlesController(),
    );
  }
}
