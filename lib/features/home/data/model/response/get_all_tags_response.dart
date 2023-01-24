class TagList {
  List<String>? tags;

  TagList({this.tags});

  TagList.fromJson(Map<String, dynamic> json) {
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (tags != null) {
      _data["tags"] = tags;
    }
    return _data;
  }
}
