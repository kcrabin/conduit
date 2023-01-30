import 'dart:convert';

import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/core/data/source/remote/network_exception.dart';
import 'package:conduit/features/home/data/model/response/get_all_tags_response.dart';

import 'package:conduit/features/home/data/source/remote/taglist_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class TagListRepositoryImpl implements TagListRepository {
  TaglistRemoteDataSource taglistRemoteDataSource;

  TagListRepositoryImpl({required this.taglistRemoteDataSource});
  TagList? tagList;
  List<String> tags = [];

  @override
  getAllTags() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      try {
        final response = await taglistRemoteDataSource.getTaglist();
        var data = jsonDecode(response.toString());
        tagList = TagList.fromJson(data);
        tags = tagList!.tags!;

        return ApiResponse(data: tags);
      } catch (error) {
        return ApiResponse(error: NetworkException.getException(error));
      }
    } else {
      return ApiResponse(error: NetworkException.noInternetConnection());
    }
  }
}
