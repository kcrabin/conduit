import 'package:conduit/features/home/data/repository/article_by_tag_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/article_by_tag_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/article_by_tag_repository.dart';
import 'package:conduit/features/home/presentation/controllers/article_by_taglist_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ArticlesByTagBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ArticleByTagRemoteDataSource>(
      ArticleByTagRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<ArticleByTagRepository>(
      ArticleByTagRepositoryImpl(
        articleByTagRemoteDataSource: Get.find<ArticleByTagRemoteDataSource>(),
      ),
    );

    Get.put(
      ArticleByTaglistController(),
    );
  }
}
