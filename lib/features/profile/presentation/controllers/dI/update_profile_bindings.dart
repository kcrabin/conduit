import 'package:conduit/features/profile/data/repository/update_user_info_repositroy_impl.dart';
import 'package:conduit/features/profile/data/source/remote/update_user_info_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/update_user_info_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/update_user_info_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class UpdateUserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UpdateUserInfoRemoteDataSource>(
      UpdateUserInfoRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<UpdateUserInfoRepository>(
      UpdateUserInfoRepositoryImpl(
        updateUserInfoRemoteDataSource:
            Get.find<UpdateUserInfoRemoteDataSource>(),
      ),
    );

    Get.put(UpdateUserInfoController());
  }
}
