class User {
  late int id;
  late String username;
  late String email;
  late String password;
  late String token;

  User ({required this.id, required this.username, required this.email, required this.password, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
      return User(
        id: json["id"] as int,
        username: json["username"].toString(),
        email: json["email"].toString(),
        password: json["password"].toString(),
        token: json["token"].toString()
    );
  }
}