import 'package:conduit/features/profile/data/repository/delete_article_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/delete_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/delete_article_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/delete_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class DeleteArticleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DeleteArticleRemoteDataSource>(
      DeleteArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<DeleteArticleRepository>(
      DeleteArticleRepositoryImpl(
        deleteArticleRemoteDataSource:
            Get.find<DeleteArticleRemoteDataSource>(),
      ),
    );

    Get.put(
      DeleteArticleController(),
    );
  }
}
