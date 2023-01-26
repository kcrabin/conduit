import 'package:conduit/features/profile/data/repository/edit_article_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/edit_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/edit_article_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/edit_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class EditArticleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<EditArticleRemoteDataSource>(
      EditArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<EditArticleRepository>(
      EditArticleRepositoryImpl(
        editArticleRemoteDataSource: Get.find<EditArticleRemoteDataSource>(),
      ),
    );

    Get.put(
      EditArticleController(),
    );
  }
}
