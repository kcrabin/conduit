import 'package:conduit/features/profile/data/models/request/update_article_request.dart';

abstract class EditArticleRepository {
  editArticle(String slug, UpdateArticleRequest updateArticleRequest);
}
