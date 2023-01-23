import 'package:conduit/features/notification/presentation/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
