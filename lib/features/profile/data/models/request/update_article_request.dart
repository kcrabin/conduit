class UpdateArticleRequest {
  Article? article;

  UpdateArticleRequest({this.article});

  UpdateArticleRequest.fromJson(Map<String, dynamic> json) {
    article =
        json["article"] == null ? null : Article.fromJson(json["article"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (article != null) {
      _data["article"] = article?.toJson();
    }
    return _data;
  }
}

class Article {
  String? body;
  String? title;
  String? description;
  List<String>? tagList;

  Article({this.body, this.title, this.description, this.tagList});

  Article.fromJson(Map<String, dynamic> json) {
    body = json["body"];
    title = json["title"];
    description = json["description"];
    tagList =
        json["tagList"] == null ? null : List<String>.from(json["tagList"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["body"] = body;
    _data["title"] = title;
    _data["description"] = description;
    if (tagList != null) {
      _data["tagList"] = tagList;
    }
    return _data;
  }
}
