import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/source/remote/follow_unfollow_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/follow_unfollow_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FollowUnfollowRepositoryImpl implements FollowUnfollowRepository {
  FollowUnfollowRemoteDataSource followUnfollowRemoteDataSource;

  FollowUnfollowRepositoryImpl({required this.followUnfollowRemoteDataSource});

  @override
  followUser(String username) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await followUnfollowRemoteDataSource.follow(username);
        var data = jsonDecode(response.toString());
        print(data);
        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }

  @override
  unfollowUser(String username) async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response =
            await followUnfollowRemoteDataSource.unfollow(username);
        var data = jsonDecode(response.toString());
        print(data);
        return ApiResponse(data: data);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
