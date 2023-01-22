class LoginResponse {
  LoginResponseInfo? user;

  LoginResponse({this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user =
        json["user"] == null ? null : LoginResponseInfo.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class LoginResponseInfo {
  String? email;
  String? username;
  dynamic bio;
  String? image;
  String? token;

  LoginResponseInfo(
      {this.email, this.username, this.bio, this.image, this.token});

  LoginResponseInfo.fromJson(Map<String, dynamic> json) {
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
