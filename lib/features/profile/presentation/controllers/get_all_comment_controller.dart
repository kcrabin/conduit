import 'package:conduit/core/data/source/remote/api_result.dart';
import 'package:conduit/features/profile/domain/repository/get_all_comment_repository.dart';
import 'package:get/get.dart';

class GetAllCommentController extends GetxController {
  ApiResponse apiResponse = ApiResponse();

  bool _isLoading = true;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;
  getAllComments(String slug) async {
    isLoading = true;
    apiResponse =
        await Get.find<GetAllCommentsRepository>().getAllComments(slug);
    update();
    isLoading = false;

    // print(apiResponse.data);
  }
}
