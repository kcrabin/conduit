
class Comment {
  Comment1? comment;

  Comment({this.comment});

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json["comment"] == null ? null : Comment1.fromJson(json["comment"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(comment != null) {
      _data["comment"] = comment?.toJson();
    }
    return _data;
  }
}

class Comment1 {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? body;
  Author? author;

  Comment1({this.id, this.createdAt, this.updatedAt, this.body, this.author});

  Comment1.fromJson(Map<String, dynamic> json) {
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