import 'dart:async';

class LoginResponse {
  LoginResponse(this.userId);

  String userId;
}

class KoException implements Exception {
  KoException(this.httpCode, this.message);

  int httpCode;
  String message;

  @override
  String toString() {
    return "KoException {httpCode: $httpCode, message: $message}";
  }
}

class FakeClient {
  static const USERNAME = "ok@test.com";
  static const PWD_OK = "correct";
  static const USER_ID = "f4f9e91f-7776-4f52-97da-dd44963fa17e";

  Future<LoginResponse> login(String username, String password) async {
    return Future.delayed(const Duration(seconds: 2), () {
      if (username == USERNAME && password == PWD_OK) {
        return LoginResponse(USER_ID);
      } else {
        throw KoException(400, "Wrong credentials");
      }
    });
  }
}
