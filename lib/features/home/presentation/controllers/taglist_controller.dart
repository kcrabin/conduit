import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/api_result.dart';

class TagListController extends GetxController {
  @override
  void onInit() {
    getAllTags();
    super.onInit();
  }

  

  bool _isLoading = true;

  // setter of _isLoading variable
  set isLoading(bool value) {
    _isLoading = value;
    update();
    // update() is the method similar to setState(){} method
  }

  bool get isLoading => _isLoading;
  ApiResponse apiResponse = ApiResponse();

  getAllTags() async {
    isLoading = true;
    apiResponse = await Get.find<TagListRepository>().getAllTags();
   
    update();
    // print('taglist fetched ---${tagList!.tags![0]}');
    isLoading = false;
  }
}
