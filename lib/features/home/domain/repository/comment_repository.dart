import 'package:conduit/features/home/data/model/comment_model.dart';

abstract class CommentRepository {
  addComment(String slug, Comment comment);
}
