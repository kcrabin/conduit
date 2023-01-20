import 'package:conduit/features/home/data/repository/comment_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/comment_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/comment_repository.dart';
import 'package:conduit/features/home/presentation/controllers/comment_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CommentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CommentRemoteDataSource>(
      CommentRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<CommentRepository>(
      CommentRepositoryImpl(
        commentRemoteDataSource: Get.find<CommentRemoteDataSource>(),
      ),
    );

    Get.put(CommentController());
  }
}
