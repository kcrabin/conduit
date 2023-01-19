import 'package:conduit/features/home/data/repository/add_new_article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:conduit/features/home/presentation/controllers/add_new_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class AddNewArticleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AddNewArticleRemoteDataSource>(
      AddNewArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put(
      AddNewArticleRepositoryImpl(
        addNewArticleRemoteDataSource:
            Get.find<AddNewArticleRemoteDataSource>(),
      ),
    );

    Get.put(AddNewArticleController());
  }
}
