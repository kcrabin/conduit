import 'package:conduit/features/home/presentation/controllers/article_controller.dart';
import 'package:conduit/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:get/instance_manager.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NavigationController(),
    );
    Get.lazyPut(
      () => ArticleController(),
    );
  }
}
