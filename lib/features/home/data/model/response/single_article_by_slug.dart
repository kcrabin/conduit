
class SingleArticleBySlug {
  Article? article;

  SingleArticleBySlug({this.article});

  SingleArticleBySlug.fromJson(Map<String, dynamic> json) {
    article = json["article"] == null ? null : Article.fromJson(json["article"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(article != null) {
      _data["article"] = article?.toJson();
    }
    return _data;
  }
}

class Article {
  String? slug;
  String? title;
  String? description;
  String? body;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  bool? favorited;
  int? favoritesCount;
  Author? author;

  Article({this.slug, this.title, this.description, this.body, this.tagList, this.createdAt, this.updatedAt, this.favorited, this.favoritesCount, this.author});

  Article.fromJson(Map<String, dynamic> json) {
    slug = json["slug"];
    title = json["title"];
    description = json["description"];
    body = json["body"];
    tagList = json["tagList"] == null ? null : List<String>.from(json["tagList"]);
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    favorited = json["favorited"];
    favoritesCount = json["favoritesCount"];
    author = json["author"] == null ? null : Author.fromJson(json["author"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["slug"] = slug;
    _data["title"] = title;
    _data["description"] = description;
    _data["body"] = body;
    if(tagList != null) {
      _data["tagList"] = tagList;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["favorited"] = favorited;
    _data["favoritesCount"] = favoritesCount;
    if(author != null) {
      _data["author"] = author?.toJson();
    }
    return _data;
  }
}

class Author {
  String? username;
  dynamic bio;
  String? image;
  bool? following;

  Author({this.username, this.bio, this.image, this.following});

  Author.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    bio = json["bio"];
    image = json["image"];
    following = json["following"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["username"] = username;
    _data["bio"] = bio;
    _data["image"] = image;
    _data["following"] = following;
    return _data;
  }
}