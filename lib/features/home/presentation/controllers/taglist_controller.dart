import 'package:conduit/features/home/data/model/response/get_all_tags_response.dart';
import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:get/get.dart';

class TagListController extends GetxController {
  @override
  void onInit() {
    getAllTags();
    super.onInit();
  }

  TagList? tagList;
  List<String> tags = [];

  bool _isLoading = true;

  // setter of _isLoading variable
  set isLoading(bool value) {
    _isLoading = value;
    update();
    // update() is the method similar to setState(){} method
  }

  bool get isLoading => _isLoading;

  getAllTags() async {
    isLoading = true;
    var data = await Get.find<TagListRepository>().getAllTags();
    tagList = TagList.fromJson(data);
    tags = tagList!.tags!;
    update();
    // print('taglist fetched ---${tagList!.tags![0]}');
    isLoading = false;
  }
}
