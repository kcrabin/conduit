import 'package:conduit/features/auth/data/repository/auth_repository_impl.dart';
import 'package:conduit/features/auth/data/source/local/auth_local_data_source.dart';
import 'package:conduit/features/auth/domain/repository/auth_repository.dart';
import 'package:conduit/features/auth/presentation/controllers/splash_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
