class UpdateUserInfo {
  UserInfo? userInfo;

  UpdateUserInfo({this.userInfo});

  UpdateUserInfo.fromJson(Map<String, dynamic> json) {
    userInfo = json["user"] == null ? null : UserInfo.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (userInfo != null) {
      _data["user"] = userInfo?.toJson();
    }
    return _data;
  }
}

class UserInfo {
  String? bio;
  String? image;

  UserInfo({this.bio, this.image});

  UserInfo.fromJson(Map<String, dynamic> json) {
    bio = json["bio"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bio"] = bio;
    _data["image"] = image;
    return _data;
  }
}
