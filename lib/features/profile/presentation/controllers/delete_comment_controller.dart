import 'package:conduit/features/profile/domain/repository/delete_comment_repository.dart';
import 'package:get/get.dart';

class DeleteCommentController extends GetxController {
  deleteSelectedComment(String slug, String commentId) async {
    await Get.find<DeleteCommentRepository>().deleteComment(slug, commentId);
  }
}
