class Contacts {
  Contacts({
    required this.userId,
    required this.username,
    required this.email,
    required this.image,
    required this.contacts,
  });

  final String? userId;
  final String? username;
  final String? email;
  final String? image;
  final List<dynamic> contacts;

  factory Contacts.fromJson(Map<String, dynamic> json){
    return Contacts(
      userId: json["userId"],
      username: json["username"],
      email: json["email"],
      image: json["image"],
      contacts: json["contacts"] == null ? [] : List<dynamic>.from(json["contacts"]!.map((x) => x)),
    );
  }

}
