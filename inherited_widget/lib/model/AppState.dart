class AppState {
  AppState({this.appTitle: "Inherited Widget"});

  String appTitle;
  String username;
  String password;
  String userId;

  @override
  String toString() {
    return "AppState{appTitle: $appTitle, username: $username, "
        "password: $password, userId: $userId}";
  }
}
