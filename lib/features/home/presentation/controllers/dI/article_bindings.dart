import 'package:conduit/features/home/data/repository/article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/article_repository.dart';
import 'package:conduit/features/home/presentation/controllers/article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ArticleRemoteDataSource>(
      ArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<ArticleRepository>(
      ArticleRepositoryImpl(
        articleRemoteDataSource: Get.find<ArticleRemoteDataSource>(),
      ),
    );

    Get.put(ArticleController());
  }
}
