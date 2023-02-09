class HttpResult {
  int statusCode;
  bool isSuccess;
  dynamic data;

  HttpResult({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
  });
}
