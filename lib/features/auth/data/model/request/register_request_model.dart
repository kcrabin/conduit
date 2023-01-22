class RegisterUser {
  RegisterUserInfo? user;

  RegisterUser({this.user});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    user =
        json["user"] == null ? null : RegisterUserInfo.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class RegisterUserInfo {
  String? email;
  String? password;
  String? username;

  RegisterUserInfo({this.email, this.password, this.username});

  RegisterUserInfo.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["username"] = username;
    return _data;
  }
}
