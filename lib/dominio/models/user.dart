import 'dart:convert';

class User {
  String name;
  String lastName;
  int id;
  DateTime birthdate;
  List<String> address;
  String? personProfilePhoto;

  User({
    required this.name,
    required this.lastName,
    required this.id,
    required this.birthdate,
    required this.address,
    this.personProfilePhoto,
  });

  User copyWith({
    String? name,
    String? lastName,
    int? id,
    DateTime? birthdate,
    List<String>? address,
  }) =>
      User(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        id: id ?? this.id,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        lastName: json["lastName"],
        id: json["id"],
        birthdate: DateTime.parse(json["birthdate"]),
        address: List<String>.from(json["address"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastName": lastName,
        "id": id,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "address": List<dynamic>.from(address.map((x) => x)),
      };
}
