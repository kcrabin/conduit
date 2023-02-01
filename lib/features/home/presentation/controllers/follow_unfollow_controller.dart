import 'package:conduit/features/home/data/repository/follow_unfollow_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/follow_unfollow_remote_data_source.dart';
import 'package:get/get.dart';

class FollowUnfollowController extends GetxController {
  FollowUnfollowRepositoryImpl followUnfollowRepositoryImpl =
      FollowUnfollowRepositoryImpl(
    followUnfollowRemoteDataSource: Get.find<FollowUnfollowRemoteDataSource>(),
  );
  requestFollow(String username) async {
    await followUnfollowRepositoryImpl.followUser(username);
    update();
  }

  requestUnfollow(String username) async {
    await followUnfollowRepositoryImpl.unfollowUser(username);
    update();
  }
}
