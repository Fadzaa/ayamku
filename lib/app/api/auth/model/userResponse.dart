class User {
  List<CurrentUser> data;

  User({
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: List<CurrentUser>.from(json["data"].map((x) => CurrentUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CurrentUser {
  int id;
  String name;
  String email;
  dynamic profilePicture;
  String phoneNumber;

  CurrentUser({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.phoneNumber,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profilePicture: json["profile_picture"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "profile_picture": profilePicture,
    "phone_number": phoneNumber,
  };
}
