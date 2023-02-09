
class SmsModel {
  SmsModel({
    required this.status,
    required this.msg,
  });

  int status;
  String msg;

  factory SmsModel.fromJson(Map<String, dynamic> json) => SmsModel(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? "",
  );


}
