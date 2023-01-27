import 'package:conduit/features/profile/data/repository/my_article_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/my_article_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/my_article_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/profile_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<MyArticleRemoteDataSource>(
      MyArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<MyArticleRepository>(
      MyArticleRepositoryImpl(
        myArticleRemoteDataSource: Get.find<MyArticleRemoteDataSource>(),
      ),
    );

    Get.put(ProfileController());
    // Get.put(GetCurrentUserBindings());
  }
}
