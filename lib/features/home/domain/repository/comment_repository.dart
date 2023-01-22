import 'package:conduit/features/home/data/model/request/comment_request_model.dart';

abstract class CommentRepository {
  addComment(String slug, CommentRequest comment);
}
