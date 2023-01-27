import 'package:conduit/features/profile/data/repository/get_current_user_repository_impl.dart';
import 'package:conduit/features/profile/data/source/remote/get_currrent_user_remote_data_source.dart';
import 'package:conduit/features/profile/domain/repository/get_current_user_repository.dart';
import 'package:conduit/features/profile/presentation/controllers/get_current_user_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetCurrentUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetCurrentUserRemoteDataSource>(
      GetCurrentUserRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put<GetCurrentUserRepository>(
      GetCurrentUserRepositoryImpl(
        getCurrentUserRemoteDataSource:
            Get.find<GetCurrentUserRemoteDataSource>(),
      ),
    );
    Get.put(GetCurrentUserController());
  }
}
