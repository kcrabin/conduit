class User {
  User1? user;

  User({this.user});

  User.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User1.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User1 {
  String? email;
  String? username;
  String? password;
  dynamic bio;
  String? image;
  String? token;

  User1(
      {this.email,
      this.username,
      this.password,
      this.bio,
      this.image,
      this.token});

  User1.fromJson(Map<String, dynamic> json) {
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
    _data["password"] = password;
    _data["bio"] = bio;
    _data["image"] = image;
    _data["token"] = token;
    return _data;
  }
}
