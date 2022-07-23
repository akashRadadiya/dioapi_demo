class User {
  User({
    required this.data,
  });

  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      email: json["email"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      avatar: json["avatar"]
  );
  Map<String, dynamic> toJson()=> {
    "id": id,
    "email": email,
    "first_name": first_name,
    "last_name": last_name,
    "avatar": avatar,
  };
}
