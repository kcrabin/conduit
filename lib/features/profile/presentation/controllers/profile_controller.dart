import 'package:conduit/core/data/source/local/storage_constants.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:conduit/features/profile/data/models/response/my_article_response.dart';
import 'package:conduit/features/profile/domain/repository/my_article_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {


  logout() {
    StorageService storageService = StorageService();

    storageService.delete(StorageConstants.accessToken);
    Get.offAllNamed('/login');
  }
}
