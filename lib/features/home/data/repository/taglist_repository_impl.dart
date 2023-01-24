import 'dart:convert';

import 'package:conduit/core/data/source/remote/custom_exception.dart';
import 'package:conduit/features/home/data/source/remote/taglist_remote_data_source.dart';
import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class TagListRepositoryImpl implements TagListRepository {
  TaglistRemoteDataSource taglistRemoteDataSource;

  TagListRepositoryImpl({required this.taglistRemoteDataSource});

  @override
  getAllTags() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == true) {
      final response = await taglistRemoteDataSource.getTaglist();
      var data = jsonDecode(response.toString());

      return data;
    } else {
      CustomException.noInternetConnecion();
    }
  }
}
