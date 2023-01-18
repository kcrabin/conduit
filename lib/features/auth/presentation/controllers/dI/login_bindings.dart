import 'package:conduit/features/auth/data/repository/login_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/login_remote_data_source.dart';
import 'package:conduit/features/auth/presentation/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginRemoteDataSource>(
      LoginRemoteDataSourceImpl(
        dio: Get.find<Dio>(),
      ),
    );

    Get.put(
      LoginRepositoryImpl(
        loginRemoteDataSource: Get.find<LoginRemoteDataSource>(),
      ),
    );
    Get.put(
      LoginController(),
    );
  }
}
