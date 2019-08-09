class AppState {
  AppState({this.appTitle: "Inherited Widget"});

  String appTitle;
  String username;
  String password;
  String userId;

  @override
  String toString() {
    return "AppState{username: $username, password: $password}";
  }
}
