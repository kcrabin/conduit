import 'package:conduit/features/profile/data/repository/delete_comment_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/delete_comment_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/delete_comment_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/delete_comment_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DeleteCommentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DeleteCommentRemoteDataSource>(
      DeleteCommentRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<DeleteCommentRepository>(
      DeleteCommentRepositoryImpl(
        deleteCommentRemoteDataSource:
            Get.find<DeleteCommentRemoteDataSource>(),
      ),
    );

    Get.put(DeleteCommentController());
  }
}
