class LoginRequest {
  LoginUserInfo? user;

  LoginRequest({this.user});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : LoginUserInfo.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class LoginUserInfo {
  String? email;
  String? password;

  LoginUserInfo({this.email, this.password});

  LoginUserInfo.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    return _data;
  }
}
