import 'package:conduit/features/home/data/model/response/get_all_tags_response.dart';
import 'package:conduit/features/home/domain/repository/taglist_repository.dart';
import 'package:get/get.dart';

class TagListController extends GetxController {
  TagList? tagList;
  List<String> tags = [];

  getAllTags() async {
    var data = await Get.find<TagListRepository>().getAllTags();
    tagList = TagList.fromJson(data);
    tags = tagList!.tags!;
    update();
    // print('taglist fetched ---${tagList!.tags![0]}');
  }

  @override
  void onInit() {
    getAllTags();
    super.onInit();
  }
}
