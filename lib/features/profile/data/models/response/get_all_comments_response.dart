class GetAllCommentsResponse {
  List<Comments>? comments;

  GetAllCommentsResponse({this.comments});

  GetAllCommentsResponse.fromJson(Map<String, dynamic> json) {
    comments = json["comments"] == null
        ? null
        : (json["comments"] as List).map((e) => Comments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (comments != null) {
      _data["comments"] = comments?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Comments {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? body;
  Author? author;

  Comments({this.id, this.createdAt, this.updatedAt, this.body, this.author});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    body = json["body"];
    author = json["author"] == null ? null : Author.fromJson(json["author"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["body"] = body;
    if (author != null) {
      _data["author"] = author?.toJson();
    }
    return _data;
  }
}

class Author {
  String? username;
  String? bio;
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
