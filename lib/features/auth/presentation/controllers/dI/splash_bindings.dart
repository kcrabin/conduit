import 'package:conduit/features/auth/presentation/controllers/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
