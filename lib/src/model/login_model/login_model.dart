class LoginModel {
  LoginModel({
    required this.status,
    required this.msg,
    required this.user,
    required this.token,
  });

  int status;
  String msg;
  User user;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] ?? 0,
        msg: json["msg"] ?? "",
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        token: json["token"] ?? "",
      );
}

class User {
  User({
    required this.firstName,
    required this.email,
    required this.password,
    required this.chat,
  });

  String firstName;
  String email;
  String password;
  int chat;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        chat: json["chat"] ?? 0,
      );
}
