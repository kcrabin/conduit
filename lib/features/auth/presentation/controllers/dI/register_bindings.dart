import 'package:conduit/features/auth/data/repository/register_repository_impl.dart';
import 'package:conduit/features/auth/data/source/remote/register_remote_data_source.dart';
import 'package:conduit/features/auth/domain/repository/register_repository.dart';
import 'package:conduit/features/auth/presentation/controllers/register_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RegisterRemoteDataSource>(
      RegisterRemoteDataSourceImpl(dio: Get.find<Dio>()),
    );

    Get.put<RegisterRepository>(
      RegisterRepositoryImpl(
          registerRemoteDataSource: Get.find<RegisterRemoteDataSource>()),
    );

    Get.put(RegisterController());
  }
}