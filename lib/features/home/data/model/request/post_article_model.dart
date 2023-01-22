class PostArticleRequest {
  ArticleRequestInfo? article;

  PostArticleRequest({this.article});

  PostArticleRequest.fromJson(Map<String, dynamic> json) {
    article = json["article"] == null
        ? null
        : ArticleRequestInfo.fromJson(json["article"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (article != null) {
      _data["article"] = article?.toJson();
    }
    return _data;
  }
}

class ArticleRequestInfo {
  String? title;
  String? description;
  String? body;
  List<String>? tagList;

  ArticleRequestInfo({this.title, this.description, this.body, this.tagList});

  ArticleRequestInfo.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    body = json["body"];
    tagList =
        json["tagList"] == null ? null : List<String>.from(json["tagList"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["body"] = body;
    if (tagList != null) {
      _data["tagList"] = tagList;
    }
    return _data;
  }
}
