import 'package:conduit/features/auth/data/repository/auth_repository_impl.dart';
import 'package:conduit/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:conduit/features/auth/domain/repository/auth_repository.dart';
import 'package:conduit/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthLocalDataSource>(
      AuthLocalDataSourceImpl(
        Get.find<FlutterSecureStorage>(),
      ),
    );

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authLocalDataSource: Get.find<AuthLocalDataSource>(),
      ),
    );

    Get.put(AuthController());
  }
}
