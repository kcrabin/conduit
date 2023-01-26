import 'package:conduit/features/home/data/repository/get_single_article_by_slug_impl.dart';
import 'package:conduit/features/home/data/source/remote/get_single_article_by_slug_data_source.dart';
import 'package:conduit/features/home/domain/repository/get_single_article_by_slug_repository.dart';
import 'package:conduit/features/home/presentation/controllers/get_single_article_by_slug_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetSingleArticleBySlugBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetSingleArticleBySlugRemoteDataSource>(
      GetSingleArticleBySlugRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<GetSingleArticleBySlug>(
      GetSingleArticleBySlugImpl(
        getSingleArticleBySlugRemoteDataSource:
            Get.find<GetSingleArticleBySlugRemoteDataSource>(),
      ),
    );

    Get.put(
      GetSingleArticleBySlugController(),
    );
  }
}
