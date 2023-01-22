class RegisterResponse {
  RegisterResponseInfo? user;

  RegisterResponse({this.user});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null
        ? null
        : RegisterResponseInfo.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class RegisterResponseInfo {
  String? email;
  String? username;
  dynamic bio;
  String? image;
  String? token;

  RegisterResponseInfo(
      {this.email, this.username, this.bio, this.image, this.token});

  RegisterResponseInfo.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    username = json["username"];
    bio = json["bio"];
    image = json["image"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["username"] = username;
    _data["bio"] = bio;
    _data["image"] = image;
    _data["token"] = token;
    return _data;
  }
}
