class User {
  final String login;
  final String avatarUrl;

  User({required this.login, required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        login: map['login'],
        avatarUrl: map['avatarUrl']);
  }
}
