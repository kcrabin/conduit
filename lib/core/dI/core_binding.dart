import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class CoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(StorageService(), permanent: true);
  }
}
