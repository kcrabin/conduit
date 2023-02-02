import 'package:conduit/features/profile/data/repository/get_all_comment_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/get_all_comment_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/get_all_comment_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/get_all_comment_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetAllCommentsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetAllCommentsRemoteDataSource>(
      GetAllCommentsRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<GetAllCommentsRepository>(
      GetAllCommentsRepositoryImpl(
        getAllCommentsRemoteDataSource:
            Get.find<GetAllCommentsRemoteDataSource>(),
      ),
    );

    Get.put(GetAllCommentController());
  }
}
