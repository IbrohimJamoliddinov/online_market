
class ProfileChangeModel {
  int status;
  String msg;
  User user;


  ProfileChangeModel({
    required this.status,
    required this.msg,
    required this.user,
  });


  factory ProfileChangeModel.fromJson(Map<String, dynamic> json) => ProfileChangeModel(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? "",
    user: json["user"] == null ? User.fromJson({}) : User.fromJson(json["user"]),
  );

}

class User {
  User({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    this.nickname,
    this.gender,
    required this.birthDate,
    required this.email,
    this.number,
    required this.chat,
  });

  String avatar;
  String firstName;
  String lastName;
  dynamic nickname;
  dynamic gender;
  DateTime birthDate;
  String email;
  dynamic number;
  int chat;

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatar: json["avatar"]?? "",
    firstName: json["first_name"]?? "",
    lastName: json["last_name"]?? "",
    nickname: json["nickname"]?? "",
    gender: json["gender"]?? "",
    birthDate: json["birth_date"] ==null ? DateTime.now() : DateTime.parse(json["birth_date"]),
    email: json["email"]?? "",
    number: json["Number"]?? "",
    chat: json["chat"] ?? 0,
  );
}
