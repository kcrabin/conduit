import 'package:conduit/core/data/source/local/storage_constants.dart';
// import 'package:conduit/core/utils/storage/sp_utils.dart';
import 'package:conduit/core/utils/storage/storage_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  logout() {
    StorageService storageService = StorageService();

    storageService.delete(StorageConstants.accessToken);
    Get.offAllNamed('/login');
  }

//   @override
//   void onInit() async {

//     super.onInit();
//   }
}
