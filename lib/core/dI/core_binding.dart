import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';

class CoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(FlutterSecureStorage());
  }
}
