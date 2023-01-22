import '../../data/model/request/post_article_model.dart';

abstract class AddNewArticleRepository {
  addArticle(PostArticleRequest postArticles);
}
