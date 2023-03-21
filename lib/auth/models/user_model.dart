class User {
  int id;
  String username;
  String password;
  String email;
  String token;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      token: json['token'],
    );
  }

  void update(User user) {
    this.id = user.id;
    this.username = user.username;
    this.password = user.password;
    this.email = user.email;
    this.token = user.token;
  }
}
