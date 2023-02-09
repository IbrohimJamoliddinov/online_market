import 'dart:convert';
import 'package:apilorning/src/model/http_result.dart';
import 'package:apilorning/src/model/profile/profile_change_model.dart';
import 'package:apilorning/src/model/profile/user_me_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as prep;

class ApiProvider {
  Future<HttpResult> getRequest(String url) async {
    if (kDebugMode) {
      print(url);
    }
    prep.Response response = await prep.get(
      Uri.parse(url),
    );
    return result(response);
  }

  Future<HttpResult> postRequest(String url, body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }
    prep.Response response = await prep.post(
      Uri.parse(url),
      body: body,
    );
    return result(response);
  }

  HttpResult result(prep.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        data: json.decode(response.body),
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        data: "Error",
      );
    }
  }

  Future<HttpResult> login(String mail, String password) async {
    var data = {
      "email": mail.trim(),
      "password": password.trim(),
    };
    String url = "http://lafyuu.qtlms.uz/api/v1/login";
    return postRequest(url, data);
  }

  Future<HttpResult> register(
      String name, String mail, String password, String confirmPass) async {
    var data = {
      "first_name": name,
      "email": mail,
      "password": password.trim(),
      "confirm_password": confirmPass,
    };
    String url = "http://lafyuu.qtlms.uz/api/v1/register";
    return postRequest(url, data);
  }

  Future<HttpResult> smsSent(String mail, String msg) async {
    var data = {
      "email": mail,
      "sms_code": msg,
    };
    String url = "http://lafyuu.qtlms.uz/api/v1/accept";

    return postRequest(url, data);
  }

  Future<HttpResult> getCategory() async {
    String url = 'http://lafyuu.qtlms.uz/api/v1/category';
    return getRequest(url);
  }

  Future<HttpResult> getSuperFlash() async {
    String url = "http://lafyuu.qtlms.uz/api/v1/superflash";
    return getRequest(url);
  }

  Future<HttpResult> getFlashSale() async {
    String url = "http://lafyuu.qtlms.uz/api/v1/product?flash_sale=true";
    return getRequest(url);
  }

  Future<HttpResult> getMageSale() async {
    String url = "http://lafyuu.qtlms.uz/api/v1/product?mega_sale=true";
    return getRequest(url);
  }

  Future<HttpResult> getHomeSale() async {
    String url = "http://lafyuu.qtlms.uz/api/v1/product?home_sale=true";
    return getRequest(url);
  }

  Future<HttpResult> getDetail(int id) async {
    String url = "http://lafyuu.qtlms.uz/api/v1/product/$id";
    return getRequest(url);
  }

  Future<UserMeModel> getProfileUser() async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMjYsInVzZXJuYW1lIjoiaWJyb2t4aW03Nzg3QGdtYWlsLmNvbSIsImV4cCI6MTY3MjQ4MDgwOCwiZW1haWwiOiJpYnJva3hpbTc3ODdAZ21haWwuY29tIn0.O-uoOFMzxyv5eom_PlCblsDgT5-OSbf_tgxcCn6FUwk";
    String url = "http://lafyuu.qtlms.uz/api/v1/me";
    prep.Response response = await prep.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    return UserMeModel.fromJson(jsonDecode(response.body));
  }

  Future<ProfileChangeModel> putProfileChange(Map list) async {
    String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMjYsInVzZXJuYW1lIjoiaWJyb2t4aW03Nzg3QGdtYWlsLmNvbSIsImV4cCI6MTY3MjQ4MDgwOCwiZW1haWwiOiJpYnJva3hpbTc3ODdAZ21haWwuY29tIn0.O-uoOFMzxyv5eom_PlCblsDgT5-OSbf_tgxcCn6FUwk";
    prep.Response response = await prep.put(
      Uri.parse("http://lafyuu.qtlms.uz/api/v1/profil"),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: list,
    );

    return ProfileChangeModel.fromJson(jsonDecode(response.body));
  }

  Future<HttpResult> getOffer(int id) async {
    String url = "http://lafyuu.qtlms.uz/api/v1/superflash/$id";
    return getRequest(url);
  }
}
