import 'package:flutter/material.dart';
import 'package:provider_sample/network/fake_client.dart';

enum ViewState { IDLE, LOADING }

class LoginModel extends ChangeNotifier {
  FakeClient _client = FakeClient();

  ViewState _viewState = ViewState.IDLE;

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  Future<String> login(String username, String password) async {
    try {
      viewState = ViewState.LOADING;
      var response = await _client.login(username, password);
      return response.userId;
    } on KoException catch (e) {
      print("LoginModel#login(): $e");
      throw e;
    } finally {
      viewState = ViewState.IDLE;
    }
  }
}
