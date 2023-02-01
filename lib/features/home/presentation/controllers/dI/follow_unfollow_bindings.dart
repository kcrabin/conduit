import 'package:conduit/features/home/data/repository/follow_unfollow_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/follow_unfollow_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/follow_unfollow_repository.dart';
import 'package:conduit/features/home/presentation/controllers/follow_unfollow_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FollowUnfollowBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<FollowUnfollowRemoteDataSource>(
      FollowUnfollowRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<FollowUnfollowRepository>(
      FollowUnfollowRepositoryImpl(
        followUnfollowRemoteDataSource:
            Get.find<FollowUnfollowRemoteDataSource>(),
      ),
    );

    Get.put(
      FollowUnfollowController(),
    );
  }
}
