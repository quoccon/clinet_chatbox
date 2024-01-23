class AuthUser {
  AuthUser({
    required this.message,
    required this.token,
    required this.user,
  });

  final String? message;
  final String? token;
  final User? user;

  factory AuthUser.fromJson(Map<String, dynamic> json){
    return AuthUser(
      message: json["message"],
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.image,
    required this.password,
  });

  final String? userId;
  final String? username;
  final String? email;
  final String? password;
  final dynamic image;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userId: json["userId"],
      username: json["username"],
      email: json["email"],
      image: json["image"],
      password: json['password'],
    );
  }

}
