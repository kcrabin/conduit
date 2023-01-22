class CommentRequest {
  Comment? comment;

  CommentRequest({this.comment});

  CommentRequest.fromJson(Map<String, dynamic> json) {
    comment =
        json["comment"] == null ? null : Comment.fromJson(json["comment"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (comment != null) {
      _data["comment"] = comment?.toJson();
    }
    return _data;
  }
}

class Comment {
  String? body;

  Comment({this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["body"] = body;
    return _data;
  }
}
