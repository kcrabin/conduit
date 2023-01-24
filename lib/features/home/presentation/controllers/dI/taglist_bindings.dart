import 'package:conduit/features/home/data/repository/taglist_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/taglist_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:conduit/features/home/presentation/controllers/taglist_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TaglistBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<TaglistRemoteDataSource>(
      TaglistRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<TagListRepository>(
      TagListRepositoryImpl(
        taglistRemoteDataSource: Get.find<TaglistRemoteDataSource>(),
      ),
    );

    Get.put(
      TagListController(),
    );
  }
}
