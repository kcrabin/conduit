import 'package:conduit/features/home/data/repository/get_all_article_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/get_all_article_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_all_article_repository.dart';
import 'package:conduit/features/home/presentation/controllers/get_all_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class GetAllArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GetAllArticleRemoteDataSource>(
      GetAllArticleRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<GetAllArticleRepository>(
      GetAllArticleRepositoryImpl(
        articleRemoteDataSource: Get.find<GetAllArticleRemoteDataSource>(),
      ),
    );

    Get.put(GetAllArticleController());
  }
}
