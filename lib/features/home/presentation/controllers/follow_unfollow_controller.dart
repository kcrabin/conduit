import 'package:conduit/features/home/data/repository/follow_unfollow_repository_impl.dart';
import 'package:conduit/features/home/data/source/remote/follow_unfollow_remote_data_source.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/api_result.dart';

class FollowUnfollowController extends GetxController {
  FollowUnfollowRepositoryImpl followUnfollowRepositoryImpl =
      FollowUnfollowRepositoryImpl(
    followUnfollowRemoteDataSource: Get.find<FollowUnfollowRemoteDataSource>(),
  );
  ApiResponse apiResponse = ApiResponse();

  requestFollow(String username) async {
    apiResponse = await followUnfollowRepositoryImpl.followUser(username);
    update();

    
  }

  requestUnfollow(String username) async {
    apiResponse = await followUnfollowRepositoryImpl.unfollowUser(username);
    update();
  }
}
